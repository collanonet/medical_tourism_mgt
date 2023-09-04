import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TransparentAppBar({
    super.key,
    this.title,
    this.leading,
    this.centerTitle,
    this.actions,
    this.iconTheme,
    this.systemOverlayStyle = SystemUiOverlayStyle.dark,
  });

  final Widget? title;
  final Widget? leading;
  final bool? centerTitle;
  final List<Widget>? actions;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final IconThemeData? iconTheme;
  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: leading,
      title: title,
      actions: actions,
      centerTitle: centerTitle,
      toolbarTextStyle: const TextStyle(color: Colors.black87),
      iconTheme: iconTheme ?? const IconThemeData(color: Colors.black87),
      actionsIconTheme: const IconThemeData(color: Colors.black87),
      systemOverlayStyle: systemOverlayStyle,
    );
  }
}
