import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../src/widgets/tertiary_button.dart';

@widgetbook.UseCase(
  name: 'Default Style',
  type: TertiaryButton,
)
Widget defaultTertiaryButton(BuildContext context) {
  return SafeArea(
    child: Center(
      child: TertiaryButton(
        onPressed: () {},
        child: Text(
          context.knobs.string(label: 'Button Label', initialValue: 'Button'),
        ),
      ),
    ),
  );
}
