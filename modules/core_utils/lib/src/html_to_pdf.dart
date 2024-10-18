import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart';
import 'package:path_provider/path_provider.dart';

import '../core_utils.dart';

Future<dynamic> generatePdfFromHtml(String htmlContent) async {
  try {
    final pdf = Document();
    List<Widget> widgets = await HTMLToPdf().convert(htmlContent);

    pdf.addPage(MultiPage(
      maxPages: 200,
      build: (context) => widgets,
    ));

    if (kIsWeb) {
      Uint8List pdfBytes = await pdf.save();
      return pdfBytes;
    } else {
      // For mobile/desktop, write the file to temp directory
      Directory tempDir = await getTemporaryDirectory();
      logger.d('tempDir: ${tempDir.path}');
      final file = File('${tempDir.path}/output.pdf');

      await file.writeAsBytes(await pdf.save());
      return file.path;  // Return the file path
    }
  } catch (e) {
    logger.e(e);
    return null;
  }
}