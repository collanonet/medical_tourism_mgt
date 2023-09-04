import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../src/widgets/divided_button_bar.dart';

@widgetbook.UseCase(name: 'Default Style', type: DividedButtonBar)
Widget defaultButtonBar(BuildContext context) {
  return SafeArea(
    child: Center(
      child: DividedButtonBar(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text('Button'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Button'),
          ),
        ],
      ),
    ),
  );
}
