import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:get_it/get_it.dart';

class FilePreview extends StatefulWidget {
  const FilePreview({super.key, required this.fileName});

  final String fileName;

  @override
  _FilePreviewState createState() => _FilePreviewState();
}

class _FilePreviewState extends State<FilePreview> {
  String? _filePath;
  bool _loading = true;
  late String baseUrl;

  @override
  void initState() {
    super.initState();
    baseUrl = GetIt.I<String>(instanceName: 'baseUrl');
    _downloadFile();
  }

  Future<void> _downloadFile() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/${widget.fileName}'));
      final bytes = response.bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/${widget.fileName}');
      await file.writeAsBytes(bytes);
      setState(() {
        _filePath = file.path;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_filePath == null) {
      return const Center(child: Text('Failed to load file'));
    }

    final fileExtension = _filePath!.split('.').last.toLowerCase();

    if (fileExtension == 'pdf') {
      return PDFView(
        filePath: _filePath!,
      );
    } else if (['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
      return Image.file(File(_filePath!));
    } else {
      return Center(
        child: Column(
          children: [
            Text('Unsupported file format'),
            TextButton(
                onPressed: () {
                  openUrlInBrowser(fileName: widget.fileName);
                },
                child: Text("Download"))
          ],
        ),
      );
    }
  }
}
