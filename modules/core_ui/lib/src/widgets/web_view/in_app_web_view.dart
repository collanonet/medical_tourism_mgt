import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class InAppWebView extends StatefulWidget {
  final String initialUrl;
  final InAppWebViewController? controller;

  const InAppWebView({
    super.key,
    required this.initialUrl,
    this.controller,
  });

  @override
  _InAppWebViewState createState() => _InAppWebViewState();
}

class _InAppWebViewState extends State<InAppWebView> {
  late final PlatformWebViewController _controller;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _controller = PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(widget.initialUrl),
      ),
    ).then((_) {
      setState(() {
        _loading = false;
      });
    }).catchError((error) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PlatformWebViewWidget(
          PlatformWebViewWidgetCreationParams(controller: _controller),
        ).build(context),
        if (_loading) const CircularProgressIndicator(),
      ],
    );
  }
}

class InAppWebViewController {
  WebViewController? _delegate;

  Future<void>? loadUrl(String url) {
    return _delegate?.loadRequest(Uri.parse(url));
  }
}
