import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class VerticalTextButton extends StatelessWidget {
  const VerticalTextButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.onLongPressed,
  });

  final Widget icon;
  final Widget label;
  final VoidCallback? onLongPressed;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.textScaleFactorOf(context);
    final double gap = scale <= 1 ? 8 : lerpDouble(8, 4, min(scale - 1, 1))!;

    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          SizedBox(height: gap),
          Flexible(child: label),
        ],
      ),
    );
  }
}
