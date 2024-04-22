import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:core_utils/core_utils.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class FileUploadService {
  FileUploadService(
    @Named('baseUrl') this.baseUrl,
  );
  Uri baseUrl;

  Future<String> uploadFile(Uint8List file, String token) async {
    if (file.isEmpty) {
      print('No file to upload');
      return '';
    }

    try {
      final _data = FormData();

      _data.files.add(MapEntry(
        'file',
        MultipartFile.fromBytes(
          file,
          filename: 'file.jpg',
        ),
      ));

      final dio = Dio(BaseOptions(
        method: 'POST',
        baseUrl: baseUrl.toString(),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'multipart/form-data',
          HttpHeaders.acceptHeader: 'application/json',
        },
      ));

      final responseD = await dio.post(
        '/files/upload',
        data: _data,
        options: Options(
          method: 'POST',
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.contentTypeHeader: 'multipart/form-data',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      return responseD.data['filename'];
    } catch (e) {
      if (e is DioError) {
        if (e.error is SocketException) {
          print('Network error: ${e.error}');
        } else if (e.response?.statusCode == 404) {
          print('File not found: ${e.response?.data}');
        } else {
          print('Unknown error: ${e.error}');
        }
      } else {
        print('Error uploading file: $e');
      }
      return '';
    }
  }
}
