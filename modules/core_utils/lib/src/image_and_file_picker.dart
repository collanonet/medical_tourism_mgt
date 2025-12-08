// Dart imports:
import 'dart:async';
import 'dart:io';
import 'dart:html' as html;
import 'dart:typed_data';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

Future<FileSelect?> imagePicker(
    {ImageSource imageSource = ImageSource.gallery}) async {
  try {
    XFile? image = await picker.pickImage(source: imageSource);

    if (image != null) {
      return FileSelect(
        filename: image.name,
        file: await image.readAsBytes(),
      );
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}

Future<List<File>?> imageMultiplePicker() async {
  try {
    List<XFile> images = await picker.pickMultiImage();

    if (images.isNotEmpty) {
      List<File> files = images.map((e) => File(e.path)).toList();

      return files;
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}

// return bytes because web support only bytes
Future<FileSelect?> filePicker() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg', 'doc', 'docx', 'xls', 'xlsx', 'mp4'],
    withData: true, // Webでbytesを取得するために必要
  );

  try {
    if (result != null) {
      final file = result.files.single;
      if (file.bytes == null) {
        throw 'ファイルの読み込みに失敗しました。bytesがnullです。';
      }
      return FileSelect(
        filename: file.name,
        file: file.bytes!,
      );
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}

Future<List<File>?> fileMultiplePicker() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg', 'doc', 'docx', 'xls', 'xlsx', 'mp4'],
  );

  try {
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}

Future<List<File>?> fileWithSpecificExtensionPicker({
  List<String> allowedExtensions = const ['jpg', 'pdf', 'png', 'jpeg', 'doc', 'docx', 'xls', 'xlsx', 'mp4'],
}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: false,
    allowedExtensions: allowedExtensions,
  );

  try {
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}

Future<List<File>?> fileMultipleWithSpecificExtensionPicker({
  List<String> allowedExtensions = const ['jpg', 'pdf', 'png', 'jpeg', 'doc', 'docx', 'xls', 'xlsx', 'mp4'],
}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: true,
    allowedExtensions: allowedExtensions,
  );

  try {
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}

// Handle file drop from drag and drop
Future<FileSelect?> handleFileDrop(List<html.File> files) async {
  if (files.isEmpty) return null;
  
  final file = files.first;
  final allowedExtensions = ['jpg', 'pdf', 'png', 'jpeg', 'doc', 'docx', 'xls', 'xlsx', 'mp4'];
  final extension = file.name.split('.').last.toLowerCase();
  
  if (!allowedExtensions.contains(extension)) {
    throw 'サポートされていないファイル形式です。許可された形式: ${allowedExtensions.join(', ')}';
  }
  
  try {
    final reader = html.FileReader();
    final completer = Completer<Uint8List>();
    
    reader.onLoad.listen((e) {
      completer.complete(reader.result as Uint8List);
    });
    
    reader.onError.listen((e) {
      completer.completeError('ファイルの読み込みに失敗しました');
    });
    
    reader.readAsArrayBuffer(file);
    final bytes = await completer.future;
    
    return FileSelect(
      filename: file.name,
      file: bytes,
    );
  } catch (e) {
    throw 'ファイルの処理に失敗しました: $e';
  }
}
