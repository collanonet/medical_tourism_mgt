bool isImage(String? filename) {
  if (filename == null) return false;
  final ext = extension(filename).toLowerCase();
  return ext == '.jpg' || ext == '.jpeg' || ext == '.png' || ext == '.gif';
}

extension(String filename) {
  return filename.substring(filename.lastIndexOf('.'));
}
