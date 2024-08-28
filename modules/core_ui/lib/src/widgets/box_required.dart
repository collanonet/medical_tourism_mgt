// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../theme/app_theme_data.dart';

Widget boxRequired({
  required bool enabled,
  required String label,
}) {
  return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: enabled ? AppThemeData.light().primaryColor : Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: enabled ? AppThemeData.light().primaryColor : Colors.grey,
        ),
      ));
}
