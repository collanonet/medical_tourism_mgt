import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ImagePreview extends StatelessWidget {
  final FileSelect fileSelect;

  const ImagePreview({super.key, required this.fileSelect});

  @override
  Widget build(BuildContext context) {
    String baseUrl = GetIt.I<String>(instanceName: 'fileUrl');
    String imageUrl = '$baseUrl${fileSelect.url}';

    return fileSelect.file != null
        ? Image.memory(fileSelect.file!)
        : Image.network(imageUrl, height: 300, fit: BoxFit.cover);
  }
}
