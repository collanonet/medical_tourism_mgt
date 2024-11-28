import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';

import '../core_utils.dart';

class DicomWebViewer extends StatelessWidget {
  final String seriesId;

  const DicomWebViewer({super.key, required this.seriesId});

  @override
  Widget build(BuildContext context) {
    // DICOM Web Viewer URL
    final String viewerUrl =
        'https://orthanc-dicon-server-collabonet.pixelplatforms.com/web-viewer/app/viewer.html?series=$seriesId';

    // Encode the Basic Auth token
    // final token = base64Encode(utf8.encode('orthanc:orthanc123#_123'));

    return WebView(
      uri: Uri.parse(viewerUrl),
      allowedHosts: [
        viewerUrl
      ],
    );
  }
}