// Dart imports:
import 'dart:io';
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Package imports:
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveWidgetToFile({
  required Widget widget,
  required String fileName,
  required GlobalKey boundaryKey,
  required Function(String) onSavedTempDir,
  bool isShare = false,
}) async {
  try {
    RenderRepaintBoundary boundary =
        boundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    String? filePath;
    if (!isShare) {
      await ImageGallerySaver.saveImage(
        pngBytes,
        quality: 100,
        name: '${fileName}_${DateTime.timestamp()}.png',
      );
    } else {
      final Directory tempDir = await getTemporaryDirectory();
      filePath = '${tempDir.path}/${fileName}_${DateTime.timestamp()}.png';
      File file = File(filePath);
      await file.writeAsBytes(pngBytes);
    }

    onSavedTempDir(filePath ?? '');
  } catch (e) {
    throw e.toString();
  }
}
