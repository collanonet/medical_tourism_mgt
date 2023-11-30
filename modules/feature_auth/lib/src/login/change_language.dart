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
    return Consumer<L10nModel>(builder: (context, model, _) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: context.appTheme.primaryColor),
          borderRadius: BorderRadius.circular(
              context.appTheme.spacing.borderRadiusMedium),
        ),
        padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.changeLanguage,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: context.appTheme.spacing.marginMedium,
            ),
            Wrap(
              children: [
                // 日本語
                TextButton(
                  onPressed: () {
                    model.setLocale(const Locale('ja'));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      model.locale == const Locale('ja')
                          ? const Icon(Icons.check_circle_rounded)
                          : const Icon(Icons.circle_outlined),
                      Text('日本語'),
                    ],
                  ),
                ),
                //简体中文
                TextButton(
                  onPressed: () {
                    model.setLocale(const Locale('zh'));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      model.locale == const Locale('zh')
                          ? const Icon(Icons.check_circle_rounded)
                          : const Icon(Icons.circle_outlined),
                      Text('简体中文'),
                    ],
                  ),
                ),

                //繁体中文
                TextButton(
                  onPressed: () {
                    model.setLocale(const Locale('zh_HK'));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      model.locale == const Locale('zh_HK')
                          ? const Icon(Icons.check_circle_rounded)
                          : const Icon(Icons.circle_outlined),
                      Text('繁体中文'),
                    ],
                  ),
                ),

                //Tiếng Việt
                TextButton(
                  onPressed: () {
                    model.setLocale(const Locale('vi'));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      model.locale == const Locale('vi')
                          ? const Icon(Icons.check_circle_rounded)
                          : const Icon(Icons.circle_outlined),
                      Text('Tiếng Việt'),
                    ],
                  ),
                ),

                TextButton(
                  onPressed: () {
                    model.setLocale(const Locale('en'));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      model.locale == const Locale('en')
                          ? const Icon(Icons.check_circle_rounded)
                          : const Icon(Icons.circle_outlined),
                      Text('English'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
