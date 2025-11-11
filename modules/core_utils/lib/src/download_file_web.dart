import 'dart:html' as html;

import 'package:get_it/get_it.dart';

Future<void> downloadFileImpl({
  required String fileName,
  String? downloadName,
}) async {
  final baseUrl = GetIt.I<String>(instanceName: 'fileUrl');
  final url = '$baseUrl$fileName';
  final uri = Uri.parse(url);
  final request = await html.HttpRequest.request(
    url,
    method: 'GET',
    responseType: 'blob',
    withCredentials: false,
  );

  final blob = request.response as html.Blob?;
  if (blob == null) {
    throw Exception('Failed to download file: response blob is null');
  }

  final objectUrl = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: objectUrl)
    ..download = downloadName ??
        (uri.pathSegments.isNotEmpty ? uri.pathSegments.last : uri.toString());

  html.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
  html.Url.revokeObjectUrl(objectUrl);
}

