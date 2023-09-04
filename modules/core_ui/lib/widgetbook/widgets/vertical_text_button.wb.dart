import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../src/widgets/vertical_text_button.dart';

@widgetbook.UseCase(name: 'Default Style', type: VerticalTextButton)
Widget defaultVerticalTextButton(BuildContext context) {
  return SafeArea(
    child: Center(
      child: VerticalTextButton(
        icon: const Icon(Icons.download),
        label: const Text('Download'),
        onPressed: () {},
      ),
    ),
  );
}
