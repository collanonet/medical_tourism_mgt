import 'package:flutter/material.dart';

import '../../core_ui.dart';
import '../../resources.dart';
import 'package:flutter_svg/svg.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({
    super.key,
    required this.errorMessage,
    this.icon,
  });

  final Text errorMessage;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox.square(
          dimension: 48,
          child:
              icon ?? SvgPicture.asset(Vectors.icWarning, package: 'core_ui'),
        ),
        const SizedBox(
          height: 16,
        ),
        DefaultTextStyle(
          style: context.textTheme.bodyMedium!,
          textAlign: TextAlign.start,
          child: errorMessage,
        ),
      ],
    );
  }
}
