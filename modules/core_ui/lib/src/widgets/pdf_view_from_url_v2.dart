import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pdfrx/pdfrx.dart';

class PdfPreviewFromUrlV2 extends StatefulWidget {
  final FileSelect fileSelect;

  const PdfPreviewFromUrlV2({Key? key, required this.fileSelect})
      : super(key: key);

  @override
  State<PdfPreviewFromUrlV2> createState() => _PdfPreviewFromUrlV2State();
}

class _PdfPreviewFromUrlV2State extends State<PdfPreviewFromUrlV2> {
  @override
  Widget build(BuildContext context) {
    String baseUrl = GetIt.I<String>(instanceName: 'fileUrl');
    String pdfUrl =
        widget.fileSelect.url != null && widget.fileSelect.url!.contains('http')
            ? widget.fileSelect.url!
            : '$baseUrl${widget.fileSelect.url}';

    return widget.fileSelect.file != null
        ? PdfViewer.data(
            widget.fileSelect.file!,
            sourceName: widget.fileSelect.filename ?? '',
          )
        : PdfViewer.uri(
            Uri.parse(pdfUrl),
          );
  }
}
