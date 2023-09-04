import 'package:flutter/widgets.dart';

import '../extensions/context_exts.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(
    this.text, {
    super.key,
    this.style,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textStyle = style ?? context.textTheme.labelMedium;

    return Text(
      text,
      style: textStyle?.copyWith(
        color: context.appTheme.errorColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
