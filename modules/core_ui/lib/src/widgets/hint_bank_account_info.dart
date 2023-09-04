import 'package:flutter/material.dart';

import '../../core_ui.dart';

class HintBankAccountInfo extends StatelessWidget {
  const HintBankAccountInfo({
    super.key,
    required this.holderName,
    required this.currency,
  });
  final String holderName;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        text: TextSpan(
          style: context.textTheme.labelMedium?.copyWith(
            color: context.theme.disabledColor,
          ),
          children: [
            TextSpan(text: holderName),
            const TextSpan(text: ' | '),
            TextSpan(
              text: currency,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
