// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:dio/dio.dart';

// Project imports:
import '../core_utils.dart';

// ignore: avoid_web_libraries_in_flutter


Future<List<DicomDetailResponse>> uploadDICOMFile() async {
  html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  uploadInput.accept = '.dcm,.DCM,.dicom,.dcim,.dicm,.ima,.img,';
  uploadInput.multiple = true; // 複数ファイル選択を有効にする
  uploadInput.click();

  List<DicomDetailResponse> dicomResponses = [];
  List<String> failedFiles = [];
  Completer<List<DicomDetailResponse>> completer = Completer();

  uploadInput.onChange.listen((e) async {
    final files = uploadInput.files;
    if (files != null && files.isNotEmpty) {
      try {
        // 複数ファイルを順次アップロード
        for (int i = 0; i < files.length; i++) {
          final file = files[i];
          
          try {
            final reader = html.FileReader();
            reader.readAsArrayBuffer(file);
            await reader.onLoad.first;

            final Uint8List fileBytes = reader.result as Uint8List;
            
            // DICOMファイル形式の検証（オプション：マジックナンバーチェック）
            // DICOMファイルは通常128バイト目から"DICM"という文字列がある
            bool isDicomFormat = false;
            if (fileBytes.length > 132) {
              final magic = String.fromCharCodes(fileBytes.sublist(128, 132));
              isDicomFormat = magic == 'DICM';
            }
            
            if (!isDicomFormat) {
              logger.w('File ${file.name} may not be a valid DICOM file (no DICM header)');
              // 警告のみで処理は続行（一部のDICOMファイルはヘッダーがない場合がある）
            }

            Dio dio = Dio();
            final token = base64Encode(utf8.encode('orthanc:orthanc123#_123'));
            dio.options.headers['Authorization'] = 'Basic $token';

            final formData = FormData.fromMap({
              'file': MultipartFile.fromBytes(
                fileBytes,
                filename: file.name,
              ),
            });

            final response = await dio.post(
              'https://orthanc-dicon-server-collabonet.pixelplatforms.com/instances',
              data: formData,
              options: Options(
                sendTimeout: const Duration(minutes: 5), // 送信タイムアウト5分
                receiveTimeout: const Duration(minutes: 5), // 受信タイムアウト5分
              ),
            );

            if (response.statusCode == 200) {
              logger.d('File uploaded successfully: ${file.name}');
              var result = DicomResponse.fromJson(response.data);
              var data = await getDICOMDetail(result.id);
              if (data != null) {
                dicomResponses.add(data);
              }
            } else {
              logger.e('Failed to upload file: ${file.name}, status: ${response.statusCode}');
              failedFiles.add('${file.name} (ステータス: ${response.statusCode})');
            }
          } catch (fileError) {
            logger.e('Error uploading file ${file.name}: $fileError');
            String errorDetail = '無効なDICOMファイル';
            if (fileError is DioException) {
              if (fileError.type == DioExceptionType.connectionError) {
                errorDetail = 'サーバー接続エラー';
              } else if (fileError.type == DioExceptionType.sendTimeout) {
                errorDetail = '送信タイムアウト';
              } else if (fileError.type == DioExceptionType.receiveTimeout) {
                errorDetail = '受信タイムアウト';
              } else if (fileError.response?.statusCode == 400) {
                errorDetail = '無効なDICOM形式';
              } else if (fileError.response?.statusCode == 401 || fileError.response?.statusCode == 403) {
                errorDetail = '認証エラー';
              }
            }
            failedFiles.add('${file.name} ($errorDetail)');
          }
        }
        
        // 全てのファイルのアップロードが完了したら結果を返す
        if (dicomResponses.isEmpty) {
          String errorMessage = 'DICOMファイルをアップロードできませんでした。\n';
          if (failedFiles.isNotEmpty) {
            errorMessage += '失敗: ${failedFiles.join(", ")}\n';
          }
          errorMessage += '対応拡張子: .dcm, .dicom, .dcim, .dicm, .ima, .img (拡張子なしも可)\n';
          errorMessage += 'Orthancサーバーへの接続を確認してください。';
          completer.completeError(errorMessage);
        } else {
          if (failedFiles.isNotEmpty) {
            // 一部成功、一部失敗の場合は警告メッセージをログに出力
            logger.w('一部のファイルがアップロードできませんでした: ${failedFiles.join(", ")}');
          }
          completer.complete(dicomResponses);
        }
      } catch (e) {
        if (e is DioException) {
          logger.e('DioError occurred: ${e.message}');
          if (e.response != null) {
            logger.e('Response data: ${e.response?.data}');
          }
        } else {
          logger.e('Error occurred during file upload: $e');
        }
        completer.completeError('DICOMファイルのアップロードでエラーが発生しました: $e');
      }
    } else {
      // ファイルが選択されなかった場合
      completer.complete(dicomResponses);
    }
  });

  return completer.future;
}

// ドラッグ&ドロップでDICOMファイルを一括アップロード
Future<List<DicomDetailResponse>> uploadDICOMFilesFromDrop(List<html.File> files) async {
  List<DicomDetailResponse> dicomResponses = [];
  List<String> skippedFiles = [];
  List<String> failedFiles = [];
  
  if (files.isEmpty) return dicomResponses;
  
  // Orthancサーバーの接続確認
  try {
    Dio testDio = Dio();
    final token = base64Encode(utf8.encode('orthanc:orthanc123#_123'));
    testDio.options.headers['Authorization'] = 'Basic $token';
    await testDio.get(
      'https://orthanc-dicon-server-collabonet.pixelplatforms.com/system',
      options: Options(
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    logger.d('Orthanc server connection successful');
  } catch (e) {
    logger.e('Cannot connect to Orthanc server: $e');
    throw Exception('Orthancサーバーに接続できません。サーバーが稼働しているか確認してください。\nエラー: $e');
  }
  
  // DICOMファイルの拡張子を定義（拡張子なしも許可）
  final dicomExtensions = ['.dcm', '.DCM', '.dicom', '.dcim', '.dicm', '.ima', '.img'];
  
  try {
    // 複数ファイルを順次アップロード
    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      
      // ファイル拡張子をチェック（拡張子がない場合は試行する）
      final fileName = file.name.toLowerCase();
      final hasExtension = fileName.contains('.');
      final hasValidExtension = !hasExtension || dicomExtensions.any((ext) => fileName.endsWith(ext.toLowerCase()));
      
      if (!hasValidExtension) {
        logger.w('Skipping file with invalid DICOM extension: ${file.name}');
        skippedFiles.add(file.name);
        continue;
      }
      
      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);
      await reader.onLoad.first;

      final Uint8List fileBytes = reader.result as Uint8List;
      
      // DICOMファイル形式の検証（オプション：マジックナンバーチェック）
      // DICOMファイルは通常128バイト目から"DICM"という文字列がある
      bool isDicomFormat = false;
      if (fileBytes.length > 132) {
        final magic = String.fromCharCodes(fileBytes.sublist(128, 132));
        isDicomFormat = magic == 'DICM';
      }
      
      if (!isDicomFormat) {
        logger.w('File ${file.name} may not be a valid DICOM file (no DICM header)');
        // 警告のみで処理は続行（一部のDICOMファイルはヘッダーがない場合がある）
      }

      Dio dio = Dio();
      final token = base64Encode(utf8.encode('orthanc:orthanc123#_123'));
      dio.options.headers['Authorization'] = 'Basic $token';

      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: file.name,
        ),
      });

      try {
        final response = await dio.post(
          'https://orthanc-dicon-server-collabonet.pixelplatforms.com/instances',
          data: formData,
          options: Options(
            sendTimeout: const Duration(minutes: 5), // 送信タイムアウト5分
            receiveTimeout: const Duration(minutes: 5), // 受信タイムアウト5分
          ),
        );

        if (response.statusCode == 200) {
          logger.d('File uploaded successfully: ${file.name}');
          var result = DicomResponse.fromJson(response.data);
          var data = await getDICOMDetail(result.id);
          if (data != null) {
            dicomResponses.add(data);
          }
        } else {
          logger.e('Failed to upload file: ${file.name}, status: ${response.statusCode}');
          failedFiles.add('${file.name} (ステータス: ${response.statusCode})');
        }
      } catch (uploadError) {
        logger.e('Error uploading file ${file.name}: $uploadError');
        String errorDetail = '無効なDICOMファイル';
        if (uploadError is DioException) {
          if (uploadError.type == DioExceptionType.connectionError) {
            errorDetail = 'サーバー接続エラー';
          } else if (uploadError.type == DioExceptionType.sendTimeout) {
            errorDetail = '送信タイムアウト';
          } else if (uploadError.type == DioExceptionType.receiveTimeout) {
            errorDetail = '受信タイムアウト';
          } else if (uploadError.response?.statusCode == 400) {
            errorDetail = '無効なDICOM形式';
          } else if (uploadError.response?.statusCode == 401 || uploadError.response?.statusCode == 403) {
            errorDetail = '認証エラー';
          }
        }
        failedFiles.add('${file.name} ($errorDetail)');
      }
    }
    
    if (dicomResponses.isEmpty) {
      String errorMessage = 'DICOMファイルをアップロードできませんでした。\n';
      if (skippedFiles.isNotEmpty) {
        errorMessage += '不正な拡張子: ${skippedFiles.join(", ")}\n';
      }
      if (failedFiles.isNotEmpty) {
        errorMessage += '失敗: ${failedFiles.join(", ")}\n';
      }
      errorMessage += '対応拡張子: .dcm, .dicom, .dcim, .dicm, .ima, .img\n';
      errorMessage += 'Orthancサーバーへの接続を確認してください。';
      throw Exception(errorMessage);
    } else if (failedFiles.isNotEmpty) {
      // 一部成功、一部失敗の場合は警告メッセージをログに出力
      logger.w('一部のファイルがアップロードできませんでした: ${failedFiles.join(", ")}');
    }
  } catch (e) {
    if (e is DioException) {
      logger.e('DioError occurred: ${e.message}');
      if (e.response != null) {
        logger.e('Response data: ${e.response?.data}');
      }
    } else {
      logger.e('Error occurred during file upload: $e');
    }
    rethrow;
  }
  
  return dicomResponses;
}
