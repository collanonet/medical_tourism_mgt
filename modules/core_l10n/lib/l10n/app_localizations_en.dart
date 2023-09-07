import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get titleAppJP => 'センター本部専用';

  @override
  String get errorUnknown => '何かが間違っていた。';

  @override
  String get errorTimeout => '時間切れ';

  @override
  String get errorConnection => '接続の問題';

  @override
  String get labelId => 'ID';

  @override
  String get labelPassword => 'パスワード';

  @override
  String get labelPleaseEnterYourInformation => '入力してください';

  @override
  String get labelForgotPassword => 'パスワードをお忘れの方はこちら＞';

  @override
  String get mgsFieldRequired => 'フィールドは必須';

  @override
  String get actionLogin => 'ログイン';

  @override
  String get mgsRequireInputLogin => 'アカウントを入力してください';
}
