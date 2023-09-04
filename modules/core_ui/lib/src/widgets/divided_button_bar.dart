import 'package:flutter/material.dart';

import '../extensions/context_exts.dart';
import 'row_separated.dart';

class DividedButtonBar extends StatelessWidget {
  const DividedButtonBar({
    super.key,
    required this.children,
    this.alignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
  });

  final MainAxisAlignment alignment;
  final MainAxisSize mainAxisSize;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: ShapeDecoration(
          color: context.appTheme.secondaryBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              context.appTheme.spacing.borderRadiusMedium,
            ),
          ),
        ),
        child: RowSeparated(
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: alignment,
          separatorBuilder: (_, __) => const VerticalDivider(
            width: 1,
            indent: 8.0,
            endIndent: 8.0,
          ),
          children: children,
        ),
      ),
    );
  }
}
