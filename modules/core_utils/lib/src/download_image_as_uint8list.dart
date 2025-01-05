// Dart imports:
import 'dart:typed_data';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

Future<Uint8List?> downloadImageAsUint8List(String fileName) async {
  try {
    String baseUrl = GetIt.I<String>(instanceName: 'fileUrl');
    Uri uri = Uri.parse('$baseUrl$fileName');
    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      print('Failed to download image: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error downloading image: $e');
    return null;
  }
}
