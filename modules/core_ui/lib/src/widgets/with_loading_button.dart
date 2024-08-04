import 'package:flutter/material.dart';

class WithLoadingButton extends StatelessWidget {
  const WithLoadingButton({
    super.key,
    required this.isLoading,
    required this.child,
    this.color,
  });

  final bool isLoading;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox.square(
            dimension: 20.0,
            child: CircularProgressIndicator.adaptive(
              backgroundColor: color ?? Colors.white,
              strokeWidth: 1.0,
            ),
          )
        : child;
  }
}
