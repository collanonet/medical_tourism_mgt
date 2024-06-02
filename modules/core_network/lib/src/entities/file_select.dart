import 'dart:typed_data';

class FileSelect {
  String filename;
  Uint8List file;
  String? path;

  FileSelect({
    required this.filename,
    required this.file,
    this.path,
  });
}
