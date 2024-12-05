// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_utils/core_utils.dart';

import '../../resources.dart';
import 'avatar.dart';

class FilePreview extends StatefulWidget {
  const FilePreview({super.key, required this.fileName});

  final String fileName;

  @override
  _FilePreviewState createState() => _FilePreviewState();
}

class _FilePreviewState extends State<FilePreview> {
  String baseUrl =
      'https://medical-tourism-api-dev-collabonet.pixelplatforms.com/files';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fileExtension = widget.fileName.split('.').last.toLowerCase();

    if (fileExtension == 'pdf') {
      return Column(
        children: [
          TextButton(
              onPressed: () {
                openUrlInBrowser(fileName: widget.fileName);
              },
              child: const Text('Download PDF')),
        ],
      );
    } else if (['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
              onPressed: () {
                openUrlInBrowser(fileName: widget.fileName);
              },
              child: const Text('Download Image')),
          Avatar.network(
            widget.fileName,
            shape: BoxShape.rectangle,
            customSize: const Size(200, 200),
            placeholder: const AssetImage(
              Images.logoMadical,
              package: 'core_ui',
            ),
          ),
        ],
      );
    } else {
      return Center(
        child: Column(
          children: [
            const Text('Unsupported file format'),
            TextButton(
                onPressed: () {
                  openUrlInBrowser(fileName: widget.fileName);
                },
                child: const Text('Open in browser')),
          ],
        ),
      );
    }
  }
}
