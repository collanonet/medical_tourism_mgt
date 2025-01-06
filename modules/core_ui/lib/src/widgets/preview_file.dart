// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';

class PreviewFile extends StatelessWidget {
  const PreviewFile({super.key,required this.fileSelect});

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
        FilePreview(fileSelect: fileSelect),
      ],
    );
  }
}
