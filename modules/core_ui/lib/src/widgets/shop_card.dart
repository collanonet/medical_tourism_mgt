import 'package:flutter/material.dart';

import '../../core_ui.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
  });

  final Widget title;
  final Widget? subtitle;
  final void Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          context.appTheme.spacing.borderRadiusMedium,
        ),
      ),
      tileColor: context.appTheme.greyContainerColor,
      contentPadding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: context.appTheme.spacing.marginMedium,
      ),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: context.appTheme.dividerColor,
        child: Icon(
          Icons.store_mall_directory_rounded,
          size: 22,
          color: context.appTheme.greyCircleColor,
        ),
      ),
      onTap: onTap,
      title: title,
      subtitle: subtitle,
      trailing: onTap != null
          ? trailing ?? const Icon(Icons.keyboard_arrow_right_rounded)
          : null,
    );
  }
}
