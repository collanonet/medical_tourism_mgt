// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

// import 'package:webview_flutter_web/webview_flutter_web.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({
    super.key,
    required this.uri,
    this.allowedHosts = const [],
  });

  final Uri uri;
  final List<String> allowedHosts;

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  late PlatformWebViewController _controller;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _controller = PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
        LoadRequestParams(
          uri: widget.uri,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWebViewWidget(
      PlatformWebViewWidgetCreationParams(controller: _controller),
    ).build(context);
  }
}
