import 'dart:math';

import 'package:flutter/material.dart';

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

  static curved(
    BuildContext context, {
    EdgeInsets? padding,
    bool useSafeArea = false,
    required Color color,
    required Widget child,
  }) {
    return Stack(
      children: [
        CustomPaint(
          size: Size.fromHeight(
            min(context.screenSize.height * 0.3, 190.0),
          ),
          painter: CurvePainter(color: color),
        ),
        AppBody(
          useSafeArea: useSafeArea,
          padding: padding,
          child: child,
        ),
      ],
    );
  }

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

class CurvePainter extends CustomPainter {
  const CurvePainter({
    required this.color,
    this.curvedness = 30.0,
  });

  final Color color;
  final double curvedness;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, size.height - curvedness);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - curvedness,
    );
    path.lineTo(size.width, 0);
    path.close();

    paint.color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
