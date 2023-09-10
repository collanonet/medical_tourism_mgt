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

  @override
  String get labelPatient => '患者';

  @override
  String get labelMedicalVisaManagement => '医療ビザ管理';

  @override
  String get labelWebAppointment => 'Web予約';

  @override
  String get labelProcessChart => '工程表';

  @override
  String get labelHospitals => '病院';

  @override
  String get labelAgents => 'エージェント';

  @override
  String get labelQuotations => '見積書';

  @override
  String get labelInvoice => '請求書';

  @override
  String get labelSalesManagement => '売上管理';

  @override
  String get labelReport => 'マスタ';

  @override
  String get labelHelp => 'ヘルプ';

  @override
  String get labelCenterHeadquarters => 'センター本部専用';

  @override
  String get labelPatientSearch => '患者検索';

  @override
  String get labelPatientName => '患者氏名';

  @override
  String get labelAgentCompanyName => 'エージェント会社名';

  @override
  String get labelHospitalName => '病院名';

  @override
  String get labelClassification => '種別';

  @override
  String get labelSalesRepresentative => '営業担当者';

  @override
  String get labelEntryDateFrom => '入国日（自）';

  @override
  String get labelEntryDateTo => '入国日（至）';

  @override
  String get labelExaminationDateFrom => '受診日（自）';

  @override
  String get labelExaminationDateTo => '受診日（至）';

  @override
  String get labelReturnDateFrom => '帰国日（自）';

  @override
  String get labelReturnDateTo => '帰国日（至）';
}
