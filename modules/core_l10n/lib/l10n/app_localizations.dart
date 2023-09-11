import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @titleAppJP.
  ///
  /// In en, this message translates to:
  /// **'センター本部専用'**
  String get titleAppJP;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'何かが間違っていた。'**
  String get errorUnknown;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'時間切れ'**
  String get errorTimeout;

  /// No description provided for @errorConnection.
  ///
  /// In en, this message translates to:
  /// **'接続の問題'**
  String get errorConnection;

  /// No description provided for @labelId.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get labelId;

  /// No description provided for @labelPassword.
  ///
  /// In en, this message translates to:
  /// **'パスワード'**
  String get labelPassword;

  /// No description provided for @labelPleaseEnterYourInformation.
  ///
  /// In en, this message translates to:
  /// **'入力してください'**
  String get labelPleaseEnterYourInformation;

  /// No description provided for @labelForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'パスワードをお忘れの方はこちら＞'**
  String get labelForgotPassword;

  /// No description provided for @mgsFieldRequired.
  ///
  /// In en, this message translates to:
  /// **'フィールドは必須'**
  String get mgsFieldRequired;

  /// No description provided for @actionLogin.
  ///
  /// In en, this message translates to:
  /// **'ログイン'**
  String get actionLogin;

  /// No description provided for @mgsRequireInputLogin.
  ///
  /// In en, this message translates to:
  /// **'アカウントを入力してください'**
  String get mgsRequireInputLogin;

  /// No description provided for @labelPatient.
  ///
  /// In en, this message translates to:
  /// **'患者'**
  String get labelPatient;

  /// No description provided for @labelMedicalVisaManagement.
  ///
  /// In en, this message translates to:
  /// **'医療ビザ管理'**
  String get labelMedicalVisaManagement;

  /// No description provided for @labelWebAppointment.
  ///
  /// In en, this message translates to:
  /// **'Web予約'**
  String get labelWebAppointment;

  /// No description provided for @labelProcessChart.
  ///
  /// In en, this message translates to:
  /// **'工程表'**
  String get labelProcessChart;

  /// No description provided for @labelHospitals.
  ///
  /// In en, this message translates to:
  /// **'病院'**
  String get labelHospitals;

  /// No description provided for @labelAgents.
  ///
  /// In en, this message translates to:
  /// **'エージェント'**
  String get labelAgents;

  /// No description provided for @labelQuotations.
  ///
  /// In en, this message translates to:
  /// **'見積書'**
  String get labelQuotations;

  /// No description provided for @labelInvoice.
  ///
  /// In en, this message translates to:
  /// **'請求書'**
  String get labelInvoice;

  /// No description provided for @labelSalesManagement.
  ///
  /// In en, this message translates to:
  /// **'売上管理'**
  String get labelSalesManagement;

  /// No description provided for @labelReport.
  ///
  /// In en, this message translates to:
  /// **'マスタ'**
  String get labelReport;

  /// No description provided for @labelHelp.
  ///
  /// In en, this message translates to:
  /// **'ヘルプ'**
  String get labelHelp;

  /// No description provided for @labelCenterHeadquarters.
  ///
  /// In en, this message translates to:
  /// **'センター本部専用'**
  String get labelCenterHeadquarters;

  /// No description provided for @labelPatientSearch.
  ///
  /// In en, this message translates to:
  /// **'患者検索'**
  String get labelPatientSearch;

  /// No description provided for @labelPatientName.
  ///
  /// In en, this message translates to:
  /// **'患者氏名'**
  String get labelPatientName;

  /// No description provided for @labelAgentCompanyName.
  ///
  /// In en, this message translates to:
  /// **'エージェント会社名'**
  String get labelAgentCompanyName;

  /// No description provided for @labelHospitalName.
  ///
  /// In en, this message translates to:
  /// **'病院名'**
  String get labelHospitalName;

  /// No description provided for @labelClassification.
  ///
  /// In en, this message translates to:
  /// **'種別'**
  String get labelClassification;

  /// No description provided for @labelSalesRepresentative.
  ///
  /// In en, this message translates to:
  /// **'営業担当者'**
  String get labelSalesRepresentative;

  /// No description provided for @labelEntryDateFrom.
  ///
  /// In en, this message translates to:
  /// **'入国日（自）'**
  String get labelEntryDateFrom;

  /// No description provided for @labelEntryDateTo.
  ///
  /// In en, this message translates to:
  /// **'入国日（至）'**
  String get labelEntryDateTo;

  /// No description provided for @labelExaminationDateFrom.
  ///
  /// In en, this message translates to:
  /// **'受診日（自）'**
  String get labelExaminationDateFrom;

  /// No description provided for @labelExaminationDateTo.
  ///
  /// In en, this message translates to:
  /// **'受診日（至）'**
  String get labelExaminationDateTo;

  /// No description provided for @labelReturnDateFrom.
  ///
  /// In en, this message translates to:
  /// **'帰国日（自）'**
  String get labelReturnDateFrom;

  /// No description provided for @labelReturnDateTo.
  ///
  /// In en, this message translates to:
  /// **'帰国日（至）'**
  String get labelReturnDateTo;

  /// No description provided for @actionClear.
  ///
  /// In en, this message translates to:
  /// **'クリア'**
  String get actionClear;

  /// No description provided for @actionSearch.
  ///
  /// In en, this message translates to:
  /// **'検索'**
  String get actionSearch;

  /// No description provided for @actionListOfPreMembers.
  ///
  /// In en, this message translates to:
  /// **'プレ会員一覧'**
  String get actionListOfPreMembers;

  /// No description provided for @actionNewRegistration.
  ///
  /// In en, this message translates to:
  /// **'新規登録'**
  String get actionNewRegistration;

  /// No description provided for @labelOrdersOnly.
  ///
  /// In en, this message translates to:
  /// **'受注のみ'**
  String get labelOrdersOnly;

  /// No description provided for @labelAll.
  ///
  /// In en, this message translates to:
  /// **'すべて'**
  String get labelAll;

  /// No description provided for @labelCXL.
  ///
  /// In en, this message translates to:
  /// **'CXL'**
  String get labelCXL;

  /// No description provided for @labelAgentName.
  ///
  /// In en, this message translates to:
  /// **'エージェント名'**
  String get labelAgentName;

  /// No description provided for @labelAgent.
  ///
  /// In en, this message translates to:
  /// **'エージェント'**
  String get labelAgent;

  /// No description provided for @labelDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'生年月日'**
  String get labelDateOfBirth;

  /// No description provided for @labelGender.
  ///
  /// In en, this message translates to:
  /// **'性別'**
  String get labelGender;

  /// No description provided for @labelNationality.
  ///
  /// In en, this message translates to:
  /// **'国籍'**
  String get labelNationality;

  /// No description provided for @labelNameOfaDisease.
  ///
  /// In en, this message translates to:
  /// **'病名'**
  String get labelNameOfaDisease;

  /// No description provided for @labelWeChatPrePatientSearch.
  ///
  /// In en, this message translates to:
  /// **'WeChatプレ患者検索'**
  String get labelWeChatPrePatientSearch;

  /// No description provided for @actionGoToRegister.
  ///
  /// In en, this message translates to:
  /// **'本登録へ'**
  String get actionGoToRegister;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'削除する'**
  String get actionDelete;

  /// No description provided for @actionDeleted.
  ///
  /// In en, this message translates to:
  /// **'削除済み'**
  String get actionDeleted;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
