import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:typed_data';
import 'dart:ui_web';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:archive/archive.dart';

class DICOMViewerPage extends StatefulWidget {
  @override
  _DICOMViewerPageState createState() => _DICOMViewerPageState();
}

class _DICOMViewerPageState extends State<DICOMViewerPage> {
  int _dicomKey = 0; // Key counter to force refresh of HtmlElementView

  @override
  void initState() {
    super.initState();

    // Register the HtmlElementView in initState
    platformViewRegistry.registerViewFactory(
      'dicomImage',
          (int viewId) => html.DivElement()..id = 'dicomImage',
    );
  }

  Future<void> loadDICOM() async {
    print("Starting DICOM file upload process...");

    // Pick the ZIP file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['zip'],
    );

    if (result != null) {
      print("File selected: ${result.files.single.name}");

      // Unzip and extract files
      final bytes = result.files.single.bytes!;
      final archive = ZipDecoder().decodeBytes(bytes);

      bool dicomFound = false;
      for (final file in archive) {
        print("Inspecting file: ${file.name}");

        if (file.isFile && file.size > 132) {
          final contentBytes = file.content as Uint8List;
          final dicomIdentifier = String.fromCharCodes(contentBytes.sublist(128, 132));
          if (dicomIdentifier == 'DICM') {
            print("Found DICOM file: ${file.name} (no extension check)");

            dicomFound = true;
            final dicomBlob = html.Blob([contentBytes], 'application/dicom');

            setState(() {
              _dicomKey++;  // Update the key to force HtmlElementView to refresh

              // Delayed JavaScript call to ensure the HTML view is ready
              Future.delayed(Duration(milliseconds: 100), () {
                js.context.callMethod('loadAndViewDICOM', [dicomBlob]);
                print("DICOM file passed to JavaScript function for viewing.");
              });
            });

            break;
          }
        }
      }
      if (!dicomFound) {
        print("No valid DICOM files found in the ZIP.");
      }
    } else {
      print("No file selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DICOM Viewer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: loadDICOM,
              child: Text('Upload DICOM ZIP'),
            ),
            SizedBox(height: 20),
            Container(
              width: 500,
              height: 500,
              color: Colors.black,
              child: HtmlElementView(
                key: ValueKey(_dicomKey),  // Change key to force refresh
                viewType: 'dicomImage',
              ),
            ),
          ],
        ),
      ),
    );
  }
}