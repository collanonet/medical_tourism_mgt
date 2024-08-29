// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:provider/provider.dart';

class ChangeLanguageWidget extends StatefulWidget {
  const ChangeLanguageWidget({super.key});

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<L10nModel>(builder: (context, model, _) {
      return IntrinsicWidth(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.appTheme.primaryColor),
            borderRadius: BorderRadius.circular(
                context.appTheme.spacing.borderRadiusMedium),
          ),
          padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  context.l10n.changeLanguage,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansJP',
                    package: 'core_ui',
                  ),
                ),
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      model.setLocale(const Locale('ja', 'JP'));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        model.locale == const Locale('ja', 'JP')
                            ? const Icon(Icons.check_circle_rounded)
                            : const Icon(Icons.circle_outlined),
                        const Text('日本語'),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      model.setLocale(const Locale('zh', 'CN'));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        model.locale == const Locale('zh', 'CN')
                            ? const Icon(Icons.check_circle_rounded)
                            : const Icon(Icons.circle_outlined),
                        const Text('简体中文'),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      model.setLocale(const Locale('zh', 'TW'));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        model.locale == const Locale('zh', 'TW')
                            ? const Icon(Icons.check_circle_rounded)
                            : const Icon(Icons.circle_outlined),
                        const Text('繁体中文'),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      model.setLocale(const Locale('vi', 'VN'));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        model.locale == const Locale('vi', 'VN')
                            ? const Icon(Icons.check_circle_rounded)
                            : const Icon(Icons.circle_outlined),
                        const Text('Tiếng Việt'),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      model.setLocale(const Locale('en', 'US'));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        model.locale == const Locale('en', 'US')
                            ? const Icon(Icons.check_circle_rounded)
                            : const Icon(Icons.circle_outlined),
                        const Text('English'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
