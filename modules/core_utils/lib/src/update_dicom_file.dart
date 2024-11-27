import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:core_network/core_network.dart';
import 'package:dio/dio.dart';

import '../core_utils.dart';
import 'get_dicom_detail.dart';

Future<List<DicomDetailResponse>> uploadDICOMFile() async {
  // Step 1: Use a file picker to select the file
  html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  uploadInput.accept = '.dcm'; // Restrict to .dcm files
  uploadInput.click();

  List<DicomDetailResponse> dicomResponses = [];
  Completer<List<DicomDetailResponse>> completer = Completer();

  // Wait for the user to select a file
  uploadInput.onChange.listen((e) async {
    final files = uploadInput.files;
    if (files != null && files.isNotEmpty) {
      final file = files.first;

      // Step 2: Read the file as Uint8List
      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);
      await reader.onLoad.first;

      // File data as Uint8List
      final Uint8List fileBytes = reader.result as Uint8List;

      // Step 3: Use Dio to upload the file
      Dio dio = Dio();
      final token = base64Encode(utf8.encode('orthanc:orthanc123#_123'));
      dio.options.headers['Authorization'] = 'Basic $token';

      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: file.name, // Use the original file name
        ),
      });

      try {
        final response = await dio.post(
          'https://orthanc-dicon-server-collabonet.pixelplatforms.com/instances',
          data: formData,
        );

        if (response.statusCode == 200) {
          logger.d('File uploaded successfully');
          var result = DicomResponse.fromJson(response.data);
          var data = await getDICOMDetail(result.id);
          if(data != null){
            dicomResponses.add(data);
            completer.complete(dicomResponses);
          }
        } else {
          logger.e('Failed to upload file: ${response.statusCode}');
          completer.completeError('Failed to upload file: ${response.statusCode}');
        }
      } catch (e) {
        logger.e('Error occurred during file upload: $e');
        completer.completeError('Error occurred during file upload: $e');
      }
    }
  });

  return completer.future;
}