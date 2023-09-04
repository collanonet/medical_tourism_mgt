import 'package:flutter/material.dart';

import '../../theme.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarWidget({
  required BuildContext context,
  required String mgs,
  SnackBarAction? action,
  Color? backgroundColor,
  Widget? prefixIcon,
}) {
  SnackBar snackBar = SnackBar(
    backgroundColor: backgroundColor,
    content: Row(
      children: [
        if (prefixIcon != null) ...{
          prefixIcon,
          const SizedBox(width: 8.0),
        },
        Text(
          mgs,
        ),
      ],
    ),
    action: action,
    padding: const EdgeInsets.all(16.0),
    margin: EdgeInsets.all(AppTheme.of(context).spacing.gutter),
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        AppTheme.of(context).spacing.borderRadiusMedium,
      ),
    ),
  );

  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
