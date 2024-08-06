import 'dart:typed_data';

class FileSelect {
  String? filename;
  Uint8List? file;
  String? url;
  String? path;

  FileSelect({
    this.filename,
    this.file,
    this.url,
    this.path,
  });
}
