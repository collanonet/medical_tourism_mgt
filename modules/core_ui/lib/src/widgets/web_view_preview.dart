import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:core_network/core_network.dart';

class WebViewPreview extends StatefulWidget {
  final FileSelect fileSelect;

  const WebViewPreview({Key? key, required this.fileSelect}) : super(key: key);

  @override
  State<WebViewPreview> createState() => _WebViewPreviewState();
}

class _WebViewPreviewState extends State<WebViewPreview> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.fileSelect.url!));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _webViewController);
  }
}
