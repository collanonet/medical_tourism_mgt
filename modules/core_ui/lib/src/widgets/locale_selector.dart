import 'package:flutter/material.dart';

import '../resources/images.dart';

class Language {
  const Language({
    required this.locale,
    required this.name,
    required this.flag,
  });

  final Locale locale;
  final String name;
  final String flag;
}

const _languages = {
  'en': Language(
    locale: Locale('en'),
    name: 'English',
    flag: Images.flagUnitedKingdom,
  ),
  'km': Language(
    locale: Locale('km'),
    name: 'ភាសាខ្មែរ',
    flag: Images.flagCambodia,
  )
};

typedef LocaleWidgetBuilder = Widget Function(
  BuildContext context,
  Language? value,
  VoidCallback showOptions,
);

class LocaleSelector extends StatefulWidget {
  const LocaleSelector({
    super.key,
    required this.value,
    required this.options,
    required this.builder,
    this.onChanged,
  });

  final List<Locale> options;
  final Locale value;
  final ValueChanged<Locale>? onChanged;
  final LocaleWidgetBuilder builder;

  @override
  State<LocaleSelector> createState() => _LocaleSelectorState();
}

class _LocaleSelectorState extends State<LocaleSelector> {
  late Locale _selectedValue;

  @override
  void initState() {
    _selectedValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _languages[_selectedValue.toString()],
      () => showLanguageOptions(context),
    );
  }

  void showLanguageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(),
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            final option = widget.options[index];
            final locale = option.toString();
            final language = _languages[locale];

            return RadioListTile<Locale>(
              value: option,
              groupValue: widget.value,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (locale) {
                if (locale == null) return;

                setState(() {
                  _selectedValue = locale;
                });
                widget.onChanged?.call(locale);
                Navigator.pop(context);
              },
              title: language == null
                  ? const SizedBox()
                  : ListTile(
                      title: Text(language.name),
                      leading: Image.asset(
                        language.flag,
                        package: 'core_ui',
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
