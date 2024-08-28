// Dart imports:
import 'dart:io';

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
    allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg'],
  );

  try {
    if (result != null) {
      // File file = File(result.files.single.path!);
      return FileSelect(
        filename: result.files.single.name,
        file: result.files.single.bytes!,
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
    allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg'],
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
  List<String> allowedExtensions = const ['jpg', 'pdf', 'png', 'jpeg'],
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
  List<String> allowedExtensions = const ['jpg', 'pdf', 'png', 'jpeg'],
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
