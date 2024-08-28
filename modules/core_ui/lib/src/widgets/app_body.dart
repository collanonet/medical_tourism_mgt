// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../extensions/context_exts.dart';

class AppBody extends StatelessWidget {
  const AppBody({
    super.key,
    this.padding,
    this.useSafeArea = true,
    required this.child,
  });

  final EdgeInsets? padding;
  final Widget child;
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    Widget content = child;
    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    final gutter = EdgeInsets.symmetric(
      horizontal: context.appTheme.spacing.gutter,
    );

    return Padding(
      padding: padding ?? gutter,
      child: content,
    );
  }
}
