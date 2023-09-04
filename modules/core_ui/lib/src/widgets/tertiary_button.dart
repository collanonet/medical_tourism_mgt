import 'package:flutter/material.dart';

import '../../core_ui.dart';

class TertiaryButton extends StatelessWidget {
  const TertiaryButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: context.theme.textButtonTheme.style?.copyWith(
          foregroundColor: MaterialStatePropertyAll(
            context.theme.primaryColor,
          ),
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 13.0,
            decoration: TextDecoration.underline,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
