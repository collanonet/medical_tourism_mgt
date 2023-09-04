import 'package:flutter/material.dart';

import '../../theme.dart';

class TicketPayment extends StatelessWidget {
  const TicketPayment({
    Key? key,
    required this.child,
    this.padding,
    this.linePart = 0.65,
    this.margin,
    this.color = Colors.white,
    this.radius,
    this.shadow,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? shadow;
  final double linePart;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(linePart: linePart),
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          boxShadow: shadow,
          color: color,
          borderRadius: BorderRadius.circular(
            radius ?? AppTheme.of(context).spacing.borderRadiusMedium,
          ),
        ),
        child: child,
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  TicketClipper({
    this.linePart = 0.65,
  });

  final double linePart;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
      Rect.fromCircle(
          center: Offset(0.0, size.height * linePart), radius: 12.0),
    );

    path.addOval(
      Rect.fromCircle(
          center: Offset(size.width, size.height * linePart), radius: 12.0),
    );

    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, 0.0),
        radius: 48.0,
      ),
    );

    double marginSpace = 15;
    double dotWidth = 6;
    double dashSpace = 5;
    double startX = marginSpace;
    double endX = size.width - marginSpace;
    double linkPoint = size.height * linePart;
    double heightLineHaft = 0.5;

    Radius corner = const Radius.circular(8.0);

    for (double x = startX; x < endX; x += dotWidth + dashSpace) {
      path.addRRect(
        RRect.fromLTRBAndCorners(
          x,
          linkPoint + heightLineHaft,
          x + dotWidth,
          linkPoint - heightLineHaft,
          topLeft: corner,
          topRight: corner,
          bottomLeft: corner,
          bottomRight: corner,
        ),
      );
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
