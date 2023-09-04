import 'dart:math';

import 'package:flutter/material.dart';

import '../extensions/context_exts.dart';
import 'app_body.dart';

class Pane extends StatelessWidget {
  const Pane({
    super.key,
    required this.title,
    this.icon,
    this.description,
    required this.children,
  });

  final Widget title;
  final Widget? description;
  final Widget? icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
    );
    final descriptionTextColor = context.appTheme.secondaryTextColor;
    final descriptionTextStyle = TextStyle(
      fontSize: 15.0,
      color: descriptionTextColor,
    );

    return AppBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: min(
              context.screenSize.height * 0.05,
              context.appTheme.spacing.marginLarge,
            ),
          ),
          if (icon != null)
            Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ),
          if (icon != null)
            SizedBox(height: context.appTheme.spacing.marginMedium),
          DefaultTextStyle(
            style: context.textTheme.titleLarge ?? titleTextStyle,
            child: title,
          ),
          if (description != null)
            SizedBox(height: context.appTheme.spacing.marginMedium),
          if (description != null)
            DefaultTextStyle(
              style: context.textTheme.bodyMedium
                      ?.copyWith(color: descriptionTextColor) ??
                  descriptionTextStyle,
              child: description!,
            ),
          SizedBox(height: context.appTheme.spacing.marginExtraLarge),
          ...children,
        ],
      ),
    );
  }
}
