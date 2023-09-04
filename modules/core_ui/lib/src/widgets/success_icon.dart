import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core_ui.dart';
import '../../resources.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({
    super.key,
    this.radius,
    this.radiusBorder,
  });

  final double? radiusBorder;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.theme.dividerColor,
      radius: radiusBorder ?? 50,
      child: CircleAvatar(
        radius: radius ?? 40.0,
        backgroundColor: context.appTheme.successColor,
        child: SvgPicture.asset(
          Vectors.icTick,
          package: 'core_ui',
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
