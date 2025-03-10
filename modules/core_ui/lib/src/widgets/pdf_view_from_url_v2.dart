import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pdfrx/pdfrx.dart';

class PdfPreviewFromUrlV2 extends StatefulWidget {
  final String url;

  const PdfPreviewFromUrlV2({Key? key, required this.url}) : super(key: key);

  @override
  State<PdfPreviewFromUrlV2> createState() => _PdfPreviewFromUrlV2State();
}

class _PdfPreviewFromUrlV2State extends State<PdfPreviewFromUrlV2> {
  @override
  Widget build(BuildContext context) {
    String baseUrl = GetIt.I<String>(instanceName: 'fileUrl');
    String pdfUrl = '$baseUrl${widget.url}';

    return PdfViewer.uri(
      Uri.parse(pdfUrl),
    );
  }
}
