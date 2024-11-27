import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';

class DicomWebViewer extends StatelessWidget {
  final String seriesId;

  const DicomWebViewer({super.key, required this.seriesId});

  @override
  Widget build(BuildContext context) {
    // DICOM Web Viewer URL
    final String viewerUrl =
        'https://orthanc-dicon-server-collabonet.pixelplatforms.com/web-viewer/app/viewer.html?series=$seriesId';

    // Encode the Basic Auth token
    final token = base64Encode(utf8.encode('orthanc:orthanc123#_123'));

    // Register the iframe element as a platform view
    // Must be done once during app initialization
    html.window.customElements?.define(
      'dicom-web-viewer',
      html.Element.tag('iframe'),
    );

    // Configure iframe
    final iframe = html.IFrameElement()
      ..src = viewerUrl
      ..style.border = 'none'
      ..style.height = '100%'
      ..style.width = '100%'
      ..setAttribute('allowfullscreen', 'true');

    // Note: `Authorization` headers cannot be passed directly to the iframe.
    // Ensure the server accepts CORS or uses a query parameter for tokens.

    return const HtmlElementView(
      viewType: 'dicom-web-viewer',
    );
  }
}