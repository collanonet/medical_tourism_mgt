// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

// Project imports:
import '../core_utils.dart';

Future<dynamic> generatePdfFromHtml(String htmlContent) async {
  try {
    final document = pw.Document();
    final List<pw.Widget> widgets = await HTMLToPdf().convert(htmlContent);
    final baseFont = pw.Font.ttf(
      (await rootBundle.load('assets/fonts/NotoSansJPRegular.ttf')),
    );
    final boldFont = pw.Font.ttf(
      (await rootBundle.load('assets/fonts/NotoSansJP_Bold.ttf')),
    );
    final theme = pw.ThemeData.withFont(
      base: baseFont,
      bold: boldFont,
    );

    document.addPage(
      pw.MultiPage(
        maxPages: 200,
        theme: theme,
        build: (context) => widgets,
      ),
    );

    if (kIsWeb) {
      Uint8List pdfBytes = await document.save();
      return pdfBytes;
    } else {
      // For mobile/desktop, write the file to temp directory
      Directory tempDir = await getTemporaryDirectory();
      logger.d('tempDir: ${tempDir.path}');
      final file = File('${tempDir.path}/output.pdf');

      await file.writeAsBytes(await document.save());
      return file.path; // Return the file path
    }
  } catch (e) {
    logger.e(e);
    return null;
  }
}
