// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import '../../core_ui.dart';

void showPreviewFile(
  BuildContext context, {
  required FileSelect fileSelect,
}) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PreviewFile(
          fileSelect: FileSelect(
            url: fileSelect.url,
          ),
        ),
      ),
    ),
  );
}

class PreviewFile extends StatelessWidget {
  const PreviewFile({super.key, required this.fileSelect});

  final FileSelect fileSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
        Expanded(child: FilePreview(fileSelect: fileSelect)),
      ],
    );
  }
}
