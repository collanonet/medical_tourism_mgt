import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';

import '../pdf_view_from_url_v2.dart';
import 'in_app_web_view.dart';

class WebViewModal extends StatefulWidget {
  final String link;

  const WebViewModal({
    super.key,
    required this.link,
  });

  @override
  _WebViewModalState createState() => _WebViewModalState();
}

class _WebViewModalState extends State<WebViewModal> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          if (_getLink() != null)
            Expanded(
              child: _isPdf()
                  ? PdfPreviewFromUrlV2(fileSelect: FileSelect(url: _getLink()!))
                  : InAppWebView(
                initialUrl: _getLink()!,
              ),
            ),
        ],
      ),
    );
  }

  String? _getLink() {
    final link = widget.link;

    if (link.isNotEmpty && Uri.tryParse(link)?.hasScheme == true) {
      return link;
    } else {
      return null;
    }
  }

  bool _isPdf() {
    return _getLink()?.endsWith('.pdf') ?? false;
  }
}
