import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class PreviewFile extends StatelessWidget {
  const PreviewFile({super.key, required this.data});

  final MaterialHospitalResponse data;

  @override
  Widget build(BuildContext context) {
    return FilePreview(fileName: data.file!);
  }
}
