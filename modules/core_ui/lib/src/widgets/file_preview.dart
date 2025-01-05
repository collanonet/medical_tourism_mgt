// Dart imports:

// Flutter imports:
import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_utils/core_utils.dart';

// Project imports:
import '../../resources.dart';
import 'avatar.dart';

class FilePreview extends StatefulWidget {
  const FilePreview({super.key, this.fileSelect});

  final FileSelect? fileSelect;

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
    final fileExtension = widget.fileSelect?.filename == null
        ? widget.fileSelect?.filename?.split('.').last.toLowerCase()
        : widget.fileSelect?.url?.split('.').last.toLowerCase();

    if (fileExtension == 'pdf') {
      return Column(
        children: [
          TextButton(
              onPressed: () {
                openUrlInBrowser(fileName: widget.fileSelect?.url ?? '');
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
                openUrlInBrowser(fileName: widget.fileSelect?.url ?? '');
              },
              child: const Text('Download Image')),
          Avatar.network(
            widget.fileSelect?.filename,
            shape: BoxShape.rectangle,
            customSize: Size(
              MediaQuery.of(context).size.width * 0.6,
              MediaQuery.of(context).size.width * 0.6,
            ),
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
                  openUrlInBrowser(fileName: widget.fileSelect?.url ?? '');
                },
                child: const Text('Open in browser')),
          ],
        ),
      );
    }
  }
}
