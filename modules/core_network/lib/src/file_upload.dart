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
      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          file,
          filename: 'file.jpg',
        ),
      });

      final dio = Dio(BaseOptions(
        method: 'POST',
        baseUrl: baseUrl.toString(),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'multipart/form-data',
        },
      ));

      final responseD = await dio.post(
        '/files/upload',
        data: formData,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.contentTypeHeader: 'multipart/form-data',
          },
        ),
      );

      return responseD.data['filename'];
    } catch (e) {
      logger.e('Error uploading file: $e');
      return '';
    }
  }
}
