import 'package:flutter/material.dart';

import '../../resources.dart';
import '../../theme.dart';

class FooterTransaction extends StatelessWidget {
  const FooterTransaction({
    super.key,
    this.radius,
    this.color,
    this.height,
  });

  final double? radius;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FooterTransactionClipper(),
      child: Container(
        height: height ?? 65.0,
        decoration: BoxDecoration(
          color: color ?? AppTheme.of(context).primaryBackgroundColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
              radius ?? AppTheme.of(context).spacing.borderRadiusMedium,
            ),
          ),
        ),
        child: Center(
          child: Image.asset(
            Images.logoGrey,
            package: 'core_ui',
          ),
        ),
      ),
    );
  }
}

class FooterTransactionClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 20);
    path.quadraticBezierTo(size.width / 4, 0, size.width / 2, 0);
    path.quadraticBezierTo(size.width - size.width / 4, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
