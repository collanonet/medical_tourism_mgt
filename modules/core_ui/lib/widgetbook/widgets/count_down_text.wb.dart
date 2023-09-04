import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../src/extensions/duration_exts.dart';
import '../../src/widgets/count_down_text.dart';

final _controller = CountDownController(
  duration: const Duration(minutes: 1),
);

@widgetbook.UseCase(name: 'Default', type: CountDownText)
Widget defaultCountDownText(BuildContext context) {
  return SafeArea(
    child: Center(
      child: CountDownText(
        controller: _controller,
        formatter: (duration) => duration.toHumanReadable('mm:ss'),
      ),
    ),
  );
}
