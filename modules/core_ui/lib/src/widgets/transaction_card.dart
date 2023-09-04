import 'package:flutter/material.dart';

import '../../theme.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.child,
    this.padding,
    this.linePart = 0.65,
    this.margin,
    this.color = Colors.white,
    this.isCornerRounded = false,
    this.shadow,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final bool isCornerRounded;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? shadow;
  final double linePart;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TransactionClipper(linePart: linePart),
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          boxShadow: shadow,
          color: color,
          borderRadius: isCornerRounded
              ? BorderRadius.vertical(
                  bottom: Radius.circular(
                    AppTheme.of(context).spacing.borderRadiusMedium,
                  ),
                )
              : BorderRadius.zero,
        ),
        child: child,
      ),
    );
  }
}

class TransactionClipper extends CustomClipper<Path> {
  TransactionClipper({
    this.linePart = 0.65,
  });

  final double linePart;

  @override
  Path getClip(Size size) {
    Path path = Path();

    // Dot dot line
    double marginSpace = 16;
    double dotWidth = 6;
    double dashSpace = 5;
    double startX = marginSpace;
    double endX = size.width - marginSpace;
    double linkPoint = size.height * linePart;
    double heightLineHaft = 0.5;
    Radius radius = const Radius.circular(8.0);
    for (double x = startX; x < endX; x += dotWidth + dashSpace) {
      path.addRRect(
        RRect.fromLTRBAndCorners(
          x,
          linkPoint + heightLineHaft,
          x + dotWidth,
          linkPoint - heightLineHaft,
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
      );
    }

    //Cut top
    double increment = size.width / 58;

    path.lineTo(0.0, 0.0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);

    double cutX = size.width;

    while (cutX > 0) {
      path.lineTo(cutX, increment);
      path.lineTo(cutX - increment, 0);
      cutX -= increment * 2;
    }
    path.lineTo(0.0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
