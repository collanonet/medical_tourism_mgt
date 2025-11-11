import 'download_file_io.dart'
    if (dart.library.html) 'download_file_web.dart';

Future<void> downloadFile({
  required String fileName,
  String? downloadName,
}) {
  return downloadFileImpl(
    fileName: fileName,
    downloadName: downloadName,
  );
}

