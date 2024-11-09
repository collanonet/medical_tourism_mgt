import 'dart:html' as html;
import 'dart:js_util' as js_util;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class DICOMViewerPage extends StatefulWidget {
  const DICOMViewerPage({super.key});

  @override
  State<DICOMViewerPage> createState() => _DICOMViewerPageState();
}

class _DICOMViewerPageState extends State<DICOMViewerPage> {
  late final html.DivElement containerElement;
  bool isInitialized = false;
  String viewId = 'dicomContainer-${DateTime.now().millisecondsSinceEpoch}';

  @override
  void initState() {
    super.initState();
    _initializeCornerstone();
  }

  void _initializeCornerstone() {
    if (!isInitialized) {
      // Create container element
      containerElement = html.DivElement()
        ..id = viewId
        ..style.width = '100%'
        ..style.height = '500px';

      // Register the platform view with unique viewId
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        viewId,
        (int viewId) => containerElement,
      );

      // Initialize Cornerstone using js_util
      js_util.callMethod(
        js_util.getProperty(html.window, 'cornerstone'),
        'enable',
        [containerElement],
      );

      isInitialized = true;
    }
  }

  Future<void> loadDICOM() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['dcm'],
        withData: true,
      );

      if (result != null && result.files.single.bytes != null) {
        final bytes = result.files.single.bytes!;
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);

        // Load and display DICOM using js_util
        final cornerstone = js_util.getProperty(html.window, 'cornerstone');
        final image = await js_util.promiseToFuture(
          js_util.callMethod(cornerstone, 'loadImage', [url]),
        );

        js_util.callMethod(
          cornerstone,
          'displayImage',
          [containerElement, image],
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading DICOM: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: loadDICOM,
          child: const Text('Load DICOM File'),
        ),
        SizedBox(
          width: double.infinity,
          height: 500,
          child: HtmlElementView(viewType: viewId),
        ),

      ],
    );
  }
}
