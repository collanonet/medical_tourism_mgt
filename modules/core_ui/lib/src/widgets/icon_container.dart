import 'package:flutter/material.dart';

import '../../core_ui.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    required this.child,
    this.color,
    this.shape,
    this.padding,
  });

  final Widget child;
  final Color? color;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: color ?? context.appTheme.secondaryColor,
        shape: shape ?? const StadiumBorder(),
      ),
      padding: padding ?? const EdgeInsets.all(8.0),
      child: child,
    );
  }
}
