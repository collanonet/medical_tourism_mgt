import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get pageTitleLogin => 'Log In';

  @override
  String get errorUnknown => 'Something went wrong';

  @override
  String get errorTimeout => 'Timeout';

  @override
  String get errorConnection => 'Connection issue';
}
