import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

Future<File> compressImage(File file,{int quality = 80}) async {
  String fileName = file.path.split('/').last;
  final result = await FlutterImageCompress.compressWithList(
    file.readAsBytesSync(),
    minHeight: 1920,
    minWidth: 1080,
    quality: quality,
  );

  // Get temporary directory
  final dir = await getTemporaryDirectory();

  // Create a new file in the temporary directory
  File compressedFile = File('${dir.path}/$fileName');

  // Write the compressed image to the new file
  await compressedFile.writeAsBytes(result);

  return compressedFile;
}
