import 'package:flutter/material.dart';

import '../extensions/context_exts.dart';

class SettingsItemMenu extends StatelessWidget {
  const SettingsItemMenu({
    super.key,
    required this.title,
    this.subtitle,
    this.iconPath,
    this.trailing,
    this.leading,
    this.textColor,
    this.onTap,
  });

  final Widget title;
  final Widget? subtitle;
  final String? iconPath;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final iconSize = context.appTheme.iconSize.iconSizeSmall;
    return ListTile(
      onTap: onTap,
      textColor: textColor,
      contentPadding: EdgeInsets.zero,
      leading: iconPath != null
          ? Image.asset(
              iconPath!,
              height: iconSize,
              width: iconSize,
              package: 'core_ui',
            )
          : leading,
      title: title,
      subtitle: subtitle,
      titleTextStyle: context.textTheme.labelMedium?.copyWith(fontSize: 15),
      trailing: onTap != null
          ? trailing ?? const Icon(Icons.keyboard_arrow_right_rounded)
          : null,
    );
  }
}
