// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';

class PreviewFile extends StatelessWidget {
  const PreviewFile({super.key, required this.data});

  final MaterialHospitalResponse data;

  @override
  Widget build(BuildContext context) {
    return FilePreview(fileName: data.file!);
  }
}
