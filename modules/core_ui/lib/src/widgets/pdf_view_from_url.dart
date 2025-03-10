import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_render/pdf_render_widgets.dart';

import 'package:get_it/get_it.dart';

class PdfPreviewFromUrl extends StatefulWidget {
  final String url;

  const PdfPreviewFromUrl({Key? key, required this.url}) : super(key: key);

  @override
  State<PdfPreviewFromUrl> createState() => _PdfPreviewFromUrlState();
}

class _PdfPreviewFromUrlState extends State<PdfPreviewFromUrl> {
  // Optional: we can use PdfViewerController to scroll/jump to pages
  final PdfViewerController _pdfViewerController = PdfViewerController();

  // Method to fetch the PDF bytes from a URL
  Future<Uint8List> _fetchPdfBytes() async {
    String baseUrl = GetIt.I<String>(instanceName: 'fileUrl');
    String pdfUrl = '$baseUrl${widget.url}';

    final response = await http.get(Uri.parse(pdfUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes; // Return the PDF bytes
    } else {
      throw Exception('Failed to load PDF (status: ${response.statusCode})');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PdfViewer.openFutureData(
      _fetchPdfBytes,                 // Download + return the PDF bytes
      viewerController: _pdfViewerController,
      onError: (error) {
        debugPrint('PdfPreviewFromUrl error: $error');
      },
      loadingBannerBuilder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
      params: const PdfViewerParams(
        padding: 10,
        minScale: 1.0,
      ),
    );
  }
}
