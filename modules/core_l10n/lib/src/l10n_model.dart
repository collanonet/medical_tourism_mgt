import 'dart:ui';

import 'package:core_storage/core_storage.dart';
import 'package:flutter/foundation.dart';

import 'package:injectable/injectable.dart';

@injectable
class L10nModel extends ChangeNotifier {
  static const _languageCodeStorageKey = 'language_code';

  L10nModel({
    @Named('defaultLocale') required this.defaultLocale,
    @Named('localeStorage') required this.storage,
  });

  final Locale defaultLocale;
  final Storage storage;

  Locale? _locale;
  Locale get locale => _locale ?? defaultLocale;

  Future<void> initialize() async {
    try {
      _locale = await Future.wait([
        storage.read(_languageCodeStorageKey),
      ]).then((values) {
        return values[0] != null ? Locale(values[0], values[1]) : null;
      });
    } catch (e) {
      _locale = defaultLocale;
    } finally {
      notifyListeners();
    }
  }

  Future<void> setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();

    return Future.wait([
      storage.write(_languageCodeStorageKey, locale.languageCode),
    ]);
  }
}
