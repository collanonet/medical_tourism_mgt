import 'package:flutter/material.dart';

import '../../core_ui.dart';
import '../../widgets.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.title,
    required this.actionLabel,
    this.message,
    this.onDone,
  });

  final String title;
  final String? message;
  final String actionLabel;
  final VoidCallback? onDone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.theme.scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.screenSize.height * 0.3,
            ),
            const SuccessIcon(),
            const SizedBox(
              height: 24,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(
              height: 24,
            ),
            if (message != null && message!.isNotEmpty)
              Text(
                message!,
                textAlign: TextAlign.center,
                style: context.textTheme.labelLarge,
              ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onDone?.call();
                },
                child: Text(actionLabel),
              ),
            )
          ],
        ),
      ),
    );
  }
}
