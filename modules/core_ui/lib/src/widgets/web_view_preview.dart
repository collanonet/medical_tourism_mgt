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
    // Initialize and configure your controller.
    _webViewController = WebViewController()
    // Enable JavaScript if needed
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // Load the target URL
      ..loadRequest(Uri.parse(widget.fileSelect.url!));
  }

  @override
  Widget build(BuildContext context) {
    // If you want platform-specific handling, you can check with kIsWeb or
    // Platform.isAndroid/Platform.isIOS, etc. For example:
    // if (!kIsWeb) {
    //   // Show something else on mobile/desktop if you prefer
    // }

    // Display the WebView
    return WebViewWidget(controller: _webViewController);
  }
}
