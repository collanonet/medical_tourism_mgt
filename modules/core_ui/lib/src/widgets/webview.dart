import 'package:flutter/widgets.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({
    super.key,
    required this.uri,
    this.allowedHosts = const [],
  });

  final Uri uri;
  final List<String> allowedHosts;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xffffffff))
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (request) {
          final uri = Uri.parse(request.url);
          for (var allowedHost in widget.allowedHosts) {
            if (uri.host == allowedHost) {
              return NavigationDecision.navigate;
            }
          }
          return NavigationDecision.prevent;
        },
      ))
      ..loadRequest(widget.uri);
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }

  @override
  void didUpdateWidget(covariant WebView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.uri != widget.uri) {
      controller.loadRequest(widget.uri);
    }
  }
}
