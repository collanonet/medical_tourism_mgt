import 'dart:io';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart';

import '../core_utils.dart';

Future<String?> generatePdfFromHtml(String htmlContent) async {
  try {
    final tempDir = Directory.systemTemp;
    final file = File('${tempDir.path}/output.pdf');
    final pdf = Document();
    List<Widget> widgets = await HTMLToPdf().convert(htmlContent);

    pdf.addPage(MultiPage(
      maxPages: 200,
      build: (context) => widgets,
    ));

    await file.writeAsBytes(await pdf.save());
    return file.path;
  } catch (e) {
    logger.e(e);
    return null;
  }
}
