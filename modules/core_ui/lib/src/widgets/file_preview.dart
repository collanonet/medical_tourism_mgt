// // Dart imports:
//
// // Flutter imports:
// import 'package:core_network/core_network.dart';
// import 'package:flutter/material.dart';
//
// // Package imports:
// import 'package:core_utils/core_utils.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
//
// // Project imports:
// import '../../resources.dart';
// import 'avatar.dart';
//

import 'dart:io';
import 'dart:typed_data';

import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class FilePreview extends StatefulWidget {
  const FilePreview({super.key, required this.fileSelect});

  final FileSelect fileSelect;

  @override
  State<FilePreview> createState() => _FilePreviewState();
}

class _FilePreviewState extends State<FilePreview> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Determine the file extension
    final fileExtension =
        widget.fileSelect.filename?.split('.').last.toLowerCase() ?? '';

    // Handle PDF files
    if (fileExtension == 'pdf') {
      return Column(
        children: [
          TextButton(
            onPressed: () {
              openUrlInBrowser(fileName: widget.fileSelect.url ?? '');
            },
            child: const Text('Download PDF'),
          ),
          widget.fileSelect.file != null
              ? PdfPreviewFromBytes(file: widget.fileSelect.file!)
              : PdfPreviewFromUrl(url: widget.fileSelect.url!),
        ],
      );
    }

    // Handle image files
    if (['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              openUrlInBrowser(fileName: widget.fileSelect.url ?? '');
            },
            child: const Text('Download Image'),
          ),
          widget.fileSelect.file != null
              ? Image.memory(widget.fileSelect.file!)
              : Image.network(widget.fileSelect.url!),
        ],
      );
    }

    // Handle unsupported file types
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Unsupported file format'),
          TextButton(
            onPressed: () {
              openUrlInBrowser(fileName: widget.fileSelect.url ?? '');
            },
            child: const Text('Open in browser'),
          ),
        ],
      ),
    );
  }
}

class PdfPreviewFromBytes extends StatelessWidget {
  final Uint8List file;

  const PdfPreviewFromBytes({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _writeToTempFile(file),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return PDFView(filePath: snapshot.data!);
        }
        return const Center(child: Text('Failed to load PDF'));
      },
    );
  }

  Future<String> _writeToTempFile(Uint8List bytes) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/temp.pdf');
    await tempFile.writeAsBytes(bytes);
    return tempFile.path;
  }
}

class PdfPreviewFromUrl extends StatefulWidget {
  final String url;

  const PdfPreviewFromUrl({super.key, required this.url});

  @override
  _PdfPreviewFromUrlState createState() => _PdfPreviewFromUrlState();
}

class _PdfPreviewFromUrlState extends State<PdfPreviewFromUrl> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    try {
      final response = await http.get(Uri.parse(widget.url));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final tempDir = await getTemporaryDirectory();
        final tempFile = File('${tempDir.path}/temp.pdf');
        await tempFile.writeAsBytes(bytes);
        setState(() {
          localPath = tempFile.path;
        });
      } else {
        // Handle the error response
        setState(() {
          localPath = null; // or show an error message
        });
      }
    } catch (e) {
      // Handle any exceptions
      setState(() {
        localPath = null; // or show an error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Preview')),
      body: localPath == null
          ? const Center(child: CircularProgressIndicator())
          : PDFView(filePath: localPath!),
    );
  }
}
