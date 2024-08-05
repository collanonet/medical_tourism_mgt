import 'package:flutter/material.dart';

class WithLoadingButton extends StatelessWidget {
  const WithLoadingButton({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingColor,
  });

  final bool isLoading;
  final Widget child;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox.square(
            dimension: 20.0,
            child: CircularProgressIndicator.adaptive(
              backgroundColor: loadingColor ?? Colors.white,
              strokeWidth: 1.0,
            ),
          )
        : child;
  }
}
