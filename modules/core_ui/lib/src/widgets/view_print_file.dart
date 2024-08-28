// Dart imports:
import 'dart:typed_data';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ViewAndPrintFileWidget extends StatelessWidget {
  final List<String> urlList;
  const ViewAndPrintFileWidget(this.urlList, {super.key});

  Future<Uint8List>? viewAndPrint(BuildContext con) async {
    final doc = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    // var imageList =
    //     await Future.wait([for (var url in urlList) networkImage(url)]);
    for (var url in urlList) {
      if (url.contains('.pdf') || url.contains('/view')) {
        final http.Response responseData = await http.get(Uri.parse(url));
        Uint8List pdf = responseData.bodyBytes;
        await Printing.layoutPdf(onLayout: (_) => pdf.buffer.asUint8List());
        doc.save();
      } else {
        var image = await networkImage(url);
        doc.addPage(pw.Page(build: (pw.Context context) {
          return pw.Container(
            width: MediaQuery.of(con).size.width,
            height: MediaQuery.of(con).size.height,
            child: pw.Image(image, fit: pw.BoxFit.fitWidth),
          ); // Center
        }));
      }
    }
    return doc.save();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<Uint8List>(
          future: viewAndPrint.call(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: PdfPreview(
                  build: (format) => snapshot.data,
                ),
              );
            }
          }),
    );
  }
}
