import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeLanguageWidget extends StatefulWidget {
  const ChangeLanguageWidget({super.key});

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.appTheme.primaryColor),
        borderRadius: BorderRadius.circular(context.appTheme.spacing.borderRadiusMedium),
      ),
      child: Wrap(
        children: [
          TextButton(
            onPressed: () {
              context.read<L10nModel>().setLocale(const Locale('en'));
            },
            child: Text('English'),
          ),
          TextButton(
            onPressed: () {
              context.read<L10nModel>().setLocale(const Locale('ja'));
            },
            style: TextButton.styleFrom(
              backgroundColor: context.appTheme.primaryColor,
            ),
            child: Text('Japanese'),
          ),
        ],
      ),
    );
  }
}
