import 'package:flutter/material.dart';
import '../../core_ui.dart';

class HeaderGradiantContainer extends StatelessWidget {
  const HeaderGradiantContainer({
    super.key,
    this.margin,
    this.padding,
    this.icon,
    this.colors,
    required this.child,
  });

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final Widget child;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: context.appTheme.spacing.marginMedium,
            vertical: 8.0,
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          context.appTheme.spacing.borderRadiusMedium,
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: colors ??
              const [
                Color(0xffFFF4D7),
                Color(0xffF7F7F7),
              ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: child,
          ),
          icon ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
