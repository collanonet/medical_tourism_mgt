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
  uploadInput.accept = '.dcm,.DCM,.dicom,.dcim,.dicm,.ima,.img';
  uploadInput.multiple = true; // 複数ファイル選択を有効にする
  uploadInput.click();

  List<DicomDetailResponse> dicomResponses = [];
  Completer<List<DicomDetailResponse>> completer = Completer();

  uploadInput.onChange.listen((e) async {
    final files = uploadInput.files;
    if (files != null && files.isNotEmpty) {
      try {
        // 複数ファイルを順次アップロード
        for (int i = 0; i < files.length; i++) {
          final file = files[i];
          
          final reader = html.FileReader();
          reader.readAsArrayBuffer(file);
          await reader.onLoad.first;

          final Uint8List fileBytes = reader.result as Uint8List;

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
          }
        }
        
        // 全てのファイルのアップロードが完了したら結果を返す
        if (dicomResponses.isEmpty) {
          completer.completeError('有効なDICOMファイルが見つかりませんでした。サポートされている拡張子: .dcm, .DCM, .dicom, .dcim, .dicm, .ima, .img');
        } else {
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
  
  if (files.isEmpty) return dicomResponses;
  
  // DICOMファイルの拡張子を定義
  final dicomExtensions = ['.dcm', '.DCM', '.dicom', '.dcim', '.dicm', '.ima', '.img'];
  
  try {
    // 複数ファイルを順次アップロード
    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      
      // ファイル拡張子をチェック
      final fileName = file.name.toLowerCase();
      final hasValidExtension = dicomExtensions.any((ext) => fileName.endsWith(ext.toLowerCase()));
      
      if (!hasValidExtension) {
        logger.w('Skipping file with invalid DICOM extension: ${file.name}');
        continue;
      }
      
      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);
      await reader.onLoad.first;

      final Uint8List fileBytes = reader.result as Uint8List;

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
      }
    }
    
    if (dicomResponses.isEmpty) {
      throw Exception('有効なDICOMファイルが見つかりませんでした。サポートされている拡張子: .dcm, .DCM, .dicom, .dcim, .dicm, .ima, .img');
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
