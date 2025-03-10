import 'package:core_network/core_network.dart';
import 'package:core_ui/src/widgets/pdf_view_from_url_v2.dart';
import 'image_view_from_url.dart';
import 'pdf_view_from_url.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import 'package:get_it/get_it.dart';


import 'row_separated.dart';

class FilePreview extends StatefulWidget {
  const FilePreview({super.key, required this.fileSelect});

  final FileSelect fileSelect;

  @override
  State<FilePreview> createState() => _FilePreviewState();
}

class _FilePreviewState extends State<FilePreview> {
  @override
  Widget build(BuildContext context) {
    final fileExtension =
        widget.fileSelect.filename?.split('.').last.toLowerCase() ??
            widget.fileSelect.url?.split('.').last.toLowerCase();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (fileExtension == 'pdf')
          Expanded(
              child: Center(
                  child: PdfPreviewFromUrlV2(url: widget.fileSelect.url ?? '')))
        else if ([
          'jpg',
          'jpeg',
          'png',
          'gif',
          'webp',
          'bmp',
          'tiff',
          'tif',
          'heic',
          'heif',
          'ico'
        ].contains(fileExtension))
          Expanded(
              child: Center(child: ImagePreview(fileSelect: widget.fileSelect)))
        else
          Expanded(
            child: Center(
                child:
                    Text('ファイル形式 ${widget.fileSelect.url} はサポートされていませんが、ダウンロードまたは印刷することはできます。')),
          ),
        const SizedBox(height: 10),
        RowSeparated(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10);
          },
          children: [
            TextButton.icon(
              onPressed: () => downloadFileWeb(widget.fileSelect.url),
              icon: const Icon(Icons.download),
              label: const Text('ダウンロードファイル'),
            ),
            TextButton.icon(
              onPressed: () =>
                  openUrlInBrowser(fileName: widget.fileSelect.url ?? ''),
              icon: const Icon(Icons.print),
              label: const Text('印刷する'),
            ),
          ],
        ),
      ],
    );
  }
}

Future<void> downloadFileWeb(String? fileName) async {
  if (fileName == null || fileName.isEmpty) {
    print('Download failed: No filename provided');
    return;
  }

  try {
    String baseUrl = GetIt.I<String>(instanceName: 'fileUrl');
    String fullUrl = '$baseUrl$fileName';
    print('Downloading from: $fullUrl');

    final response = await http.get(Uri.parse(fullUrl));
    if (response.statusCode == 200) {
      // Convert response bytes to a Blob
      final blob = html.Blob([response.bodyBytes]);

      // Create object URL
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create anchor element and trigger download
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", fileName)
        ..click();

      // Clean up the URL
      html.Url.revokeObjectUrl(url);
      print('Download started for: $fileName');
    } else {
      print('Download failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Download error: $e');
  }
}
