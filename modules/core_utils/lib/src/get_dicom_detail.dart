import 'dart:convert';
import 'package:core_network/core_network.dart';
import 'package:dio/dio.dart';

import '../core_utils.dart';

Future<DicomDetailResponse?> getDICOMDetail(String id) async {
  // Initialize Dio
  Dio dio = Dio();

  // Set the authorization header with Basic Auth
  final token = base64Encode(utf8.encode('orthanc:orthanc123#_123'));
  dio.options.headers['Authorization'] = 'Basic $token';

  try {
    // Perform the GET request
    final response = await dio.get(
      'https://orthanc-dicon-server-collabonet.pixelplatforms.com/instances/$id',
    );

    // Check the response status
    if (response.statusCode == 200) {
      logger.d('DICOM details retrieved successfully:');
      logger.d(response.data);
      return DicomDetailResponse.fromJson(response.data);
    } else {
      logger.e('Failed to retrieve DICOM details: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    logger.e('Error occurred while fetching DICOM details: $e');
    return null;
  }
}