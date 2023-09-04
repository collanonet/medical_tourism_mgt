import 'package:flutter/material.dart';

import '../../core_ui.dart';

class TileMenuContainer extends StatelessWidget {
  const TileMenuContainer({
    super.key,
    this.color = Colors.white,
    required this.children,
  });

  final List<Widget> children;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            context.appTheme.spacing.borderRadiusMedium),
        color: color,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
