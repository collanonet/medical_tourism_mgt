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

  /// No description provided for @pageTitleLogin.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get pageTitleLogin;

  /// No description provided for @pageSubtitleLogin.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number that registered with a PIN'**
  String get pageSubtitleLogin;

  /// No description provided for @pageTitleQrScan.
  ///
  /// In en, this message translates to:
  /// **'Total to Pay'**
  String get pageTitleQrScan;

  /// No description provided for @actionLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get actionLogin;

  /// No description provided for @pageTitlePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get pageTitlePhoneNumber;

  /// No description provided for @pageSubtitlePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number that registered with \nKB PRASAC Accounut'**
  String get pageSubtitlePhoneNumber;

  /// No description provided for @labelPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get labelPhoneNumber;

  /// No description provided for @hintReferralCode.
  ///
  /// In en, this message translates to:
  /// **'Referral code (optional)'**
  String get hintReferralCode;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @pageTitleVerifyCode.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get pageTitleVerifyCode;

  /// No description provided for @pageSubtitleVerifyCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the code we sent to {phone_number}'**
  String pageSubtitleVerifyCode(Object phone_number);

  /// No description provided for @labelResendOtpAgainIn.
  ///
  /// In en, this message translates to:
  /// **'Resend code in {seconds}'**
  String labelResendOtpAgainIn(Object seconds);

  /// No description provided for @actionResendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get actionResendCode;

  /// No description provided for @errorOtpInvalid.
  ///
  /// In en, this message translates to:
  /// **'Incorrect code! Please try again.'**
  String get errorOtpInvalid;

  /// No description provided for @actionOk.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get actionOk;

  /// No description provided for @pageTitleForgetPin.
  ///
  /// In en, this message translates to:
  /// **'Forget PIN'**
  String get pageTitleForgetPin;

  /// No description provided for @pageSubtitleForgetPin.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number that registered with your PIN Code'**
  String get pageSubtitleForgetPin;

  /// No description provided for @labelForgetPin.
  ///
  /// In en, this message translates to:
  /// **'Forget PIN?'**
  String get labelForgetPin;

  /// No description provided for @labelEnterNewPin.
  ///
  /// In en, this message translates to:
  /// **'Enter New PIN'**
  String get labelEnterNewPin;

  /// No description provided for @labelEnterYourPin.
  ///
  /// In en, this message translates to:
  /// **'Enter Your PIN'**
  String get labelEnterYourPin;

  /// No description provided for @labelConfirmPin.
  ///
  /// In en, this message translates to:
  /// **'Confirm Your new PIN'**
  String get labelConfirmPin;

  /// No description provided for @page_account_number_title.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get page_account_number_title;

  /// No description provided for @page_account_number_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your account number on customer card'**
  String get page_account_number_subtitle;

  /// No description provided for @label_account_number.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get label_account_number;

  /// No description provided for @page_scan_card_title.
  ///
  /// In en, this message translates to:
  /// **'Scan Card'**
  String get page_scan_card_title;

  /// No description provided for @label_scan_card_info.
  ///
  /// In en, this message translates to:
  /// **'Make sure the front of your account card is in frame'**
  String get label_scan_card_info;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorUnknown;

  /// No description provided for @errorPinFailedAttempt.
  ///
  /// In en, this message translates to:
  /// **'Incorrect PIN: {attempt_left} more attempts left'**
  String errorPinFailedAttempt(Object attempt_left);

  /// No description provided for @actionGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get actionGetStarted;

  /// No description provided for @titleHelpAndSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get titleHelpAndSupport;

  /// No description provided for @messageInfoHelpAndSupport.
  ///
  /// In en, this message translates to:
  /// **'If you have any concerns or request check out the list of informations below'**
  String get messageInfoHelpAndSupport;

  /// No description provided for @labelKHQRMaterialRequest.
  ///
  /// In en, this message translates to:
  /// **'KHQR Material Request'**
  String get labelKHQRMaterialRequest;

  /// No description provided for @labelContactCallCenter.
  ///
  /// In en, this message translates to:
  /// **'Contact Call Center'**
  String get labelContactCallCenter;

  /// No description provided for @labelFAQs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get labelFAQs;

  /// No description provided for @labelMessenger.
  ///
  /// In en, this message translates to:
  /// **'Messenger'**
  String get labelMessenger;

  /// No description provided for @labelTelegram.
  ///
  /// In en, this message translates to:
  /// **'Telegram'**
  String get labelTelegram;

  /// No description provided for @labelBizName.
  ///
  /// In en, this message translates to:
  /// **'Business Name'**
  String get labelBizName;

  /// No description provided for @messageLabelBizNam.
  ///
  /// In en, this message translates to:
  /// **'Must have from 5 to 18 character and the same as official supported document'**
  String get messageLabelBizNam;

  /// No description provided for @labelMerchantType.
  ///
  /// In en, this message translates to:
  /// **'Merchant Type'**
  String get labelMerchantType;

  /// No description provided for @labelBusinessCategory.
  ///
  /// In en, this message translates to:
  /// **'Business Category'**
  String get labelBusinessCategory;

  /// No description provided for @labelShopType.
  ///
  /// In en, this message translates to:
  /// **'Shop Type'**
  String get labelShopType;

  /// No description provided for @labelCommentToKBPRASACStaff.
  ///
  /// In en, this message translates to:
  /// **'Comment to KB PRASAC staff(optional)'**
  String get labelCommentToKBPRASACStaff;

  /// No description provided for @labelSupportedDocument.
  ///
  /// In en, this message translates to:
  /// **'Supported Document (optional)'**
  String get labelSupportedDocument;

  /// No description provided for @hintMessageSupportedDocument.
  ///
  /// In en, this message translates to:
  /// **'Can be upload multiple documents'**
  String get hintMessageSupportedDocument;

  /// No description provided for @actionUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get actionUpload;

  /// No description provided for @labelProvinceCity.
  ///
  /// In en, this message translates to:
  /// **'Province/City'**
  String get labelProvinceCity;

  /// No description provided for @labelDistrict.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get labelDistrict;

  /// No description provided for @labelCommune.
  ///
  /// In en, this message translates to:
  /// **'Commune'**
  String get labelCommune;

  /// No description provided for @labelVillage.
  ///
  /// In en, this message translates to:
  /// **'Village'**
  String get labelVillage;

  /// No description provided for @labelAddressLine.
  ///
  /// In en, this message translates to:
  /// **'Address Line'**
  String get labelAddressLine;

  /// No description provided for @hintAddressLine.
  ///
  /// In en, this message translates to:
  /// **'House number, street no.'**
  String get hintAddressLine;

  /// No description provided for @labelLocation.
  ///
  /// In en, this message translates to:
  /// **'Locations'**
  String get labelLocation;

  /// No description provided for @labelPinOnAddress.
  ///
  /// In en, this message translates to:
  /// **'Pin on Address'**
  String get labelPinOnAddress;

  /// No description provided for @actionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// No description provided for @titleSetupNewBusiness.
  ///
  /// In en, this message translates to:
  /// **'Setup New Business'**
  String get titleSetupNewBusiness;

  /// No description provided for @requiredMgsInputBizName.
  ///
  /// In en, this message translates to:
  /// **'The business must not be empty'**
  String get requiredMgsInputBizName;

  /// No description provided for @maximum.
  ///
  /// In en, this message translates to:
  /// **'maximum'**
  String get maximum;

  /// No description provided for @least.
  ///
  /// In en, this message translates to:
  /// **'least'**
  String get least;

  /// No description provided for @requiredMgsInputBizNameMaxMin.
  ///
  /// In en, this message translates to:
  /// **'The business must have at {maximum} {length} characters'**
  String requiredMgsInputBizNameMaxMin(Object length, Object maximum);

  /// No description provided for @requiredMgsSelectMerchantType.
  ///
  /// In en, this message translates to:
  /// **'The merchant type is required'**
  String get requiredMgsSelectMerchantType;

  /// No description provided for @requiredMgsSelectBizCategory.
  ///
  /// In en, this message translates to:
  /// **'The business category is required'**
  String get requiredMgsSelectBizCategory;

  /// No description provided for @requiredMgsSelectShopType.
  ///
  /// In en, this message translates to:
  /// **'The shop type is required'**
  String get requiredMgsSelectShopType;

  /// No description provided for @requiredMgsSelectProvinceCity.
  ///
  /// In en, this message translates to:
  /// **'The province or city is required'**
  String get requiredMgsSelectProvinceCity;

  /// No description provided for @requiredMgsSelectDistrict.
  ///
  /// In en, this message translates to:
  /// **'The district is required'**
  String get requiredMgsSelectDistrict;

  /// No description provided for @requiredMgsSelectCommune.
  ///
  /// In en, this message translates to:
  /// **'The commune is required'**
  String get requiredMgsSelectCommune;

  /// No description provided for @requiredMgsSelectVillage.
  ///
  /// In en, this message translates to:
  /// **'The village is required'**
  String get requiredMgsSelectVillage;

  /// No description provided for @errorMgsUnableSelectThisImage.
  ///
  /// In en, this message translates to:
  /// **'Unable select this image, Please try other image'**
  String get errorMgsUnableSelectThisImage;

  /// No description provided for @titleCropImage.
  ///
  /// In en, this message translates to:
  /// **'Crop Image'**
  String get titleCropImage;

  /// No description provided for @titleSupportedDocument.
  ///
  /// In en, this message translates to:
  /// **'Supported Document'**
  String get titleSupportedDocument;

  /// No description provided for @descriptionSupportDocumentH.
  ///
  /// In en, this message translates to:
  /// **'Document support (jpg, png, pdf)'**
  String get descriptionSupportDocumentH;

  /// No description provided for @descriptionSupportDocumentS.
  ///
  /// In en, this message translates to:
  /// **'Memorandum and Articles of Association;Certificate of Incorporation;Approval Letter to Operate Business Issued by the Concerned Ministry or Related Authority;Photo of the business;Business patent;Business license'**
  String get descriptionSupportDocumentS;

  /// No description provided for @actionGoToHomePage.
  ///
  /// In en, this message translates to:
  /// **'Go to Homepage'**
  String get actionGoToHomePage;

  /// No description provided for @titleSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get titleSuccess;

  /// No description provided for @labelNewUser.
  ///
  /// In en, this message translates to:
  /// **'New User'**
  String get labelNewUser;

  /// No description provided for @labelIHaveReadAndAcceptThe.
  ///
  /// In en, this message translates to:
  /// **'I have read and accept the'**
  String get labelIHaveReadAndAcceptThe;

  /// No description provided for @labelKBPRASACMerchantAgreement.
  ///
  /// In en, this message translates to:
  /// **'KB PRASAC Merchant Agreement'**
  String get labelKBPRASACMerchantAgreement;

  /// No description provided for @labelIHaveReadAndAcceptToAllOfTheAbove.
  ///
  /// In en, this message translates to:
  /// **'I have read and accept to all of the above'**
  String get labelIHaveReadAndAcceptToAllOfTheAbove;

  /// No description provided for @actionOpenNewAccountInKBPRASACMobileApp.
  ///
  /// In en, this message translates to:
  /// **'Open new account in KB PRASAC Mobile App'**
  String get actionOpenNewAccountInKBPRASACMobileApp;

  /// No description provided for @labelNoKBPRASACAccount.
  ///
  /// In en, this message translates to:
  /// **'No KB PRASAC account?'**
  String get labelNoKBPRASACAccount;

  /// No description provided for @actionRegisterWithInviteCode.
  ///
  /// In en, this message translates to:
  /// **'Register with Invite Code'**
  String get actionRegisterWithInviteCode;

  /// No description provided for @actionRegisterWithKBPRASACAccount.
  ///
  /// In en, this message translates to:
  /// **'Register with KB PRASAC Account'**
  String get actionRegisterWithKBPRASACAccount;

  /// No description provided for @actionImNewUserToKBPRASACMerchant.
  ///
  /// In en, this message translates to:
  /// **'I’m new user to KB PRASAC Merchant'**
  String get actionImNewUserToKBPRASACMerchant;

  /// No description provided for @mgsBizCreateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Congrats, you’re all done. Your KB PRASAC account is completed successfully.'**
  String get mgsBizCreateSuccess;

  /// No description provided for @labelListOfShops.
  ///
  /// In en, this message translates to:
  /// **'List of Shops'**
  String get labelListOfShops;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionTakephoto.
  ///
  /// In en, this message translates to:
  /// **'Take photo'**
  String get actionTakephoto;

  /// No description provided for @actionChoosefromphotos.
  ///
  /// In en, this message translates to:
  /// **'Choose from photos'**
  String get actionChoosefromphotos;

  /// No description provided for @labelTermsConditionsandMerchantAgreement.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions and Merchant Agreement'**
  String get labelTermsConditionsandMerchantAgreement;

  /// No description provided for @titleSetupBusinessInfo.
  ///
  /// In en, this message translates to:
  /// **'Setup Business Info'**
  String get titleSetupBusinessInfo;

  /// No description provided for @actionPickLocation.
  ///
  /// In en, this message translates to:
  /// **'Pick Location'**
  String get actionPickLocation;

  /// No description provided for @titlePinOnAddress.
  ///
  /// In en, this message translates to:
  /// **'Pin on Address'**
  String get titlePinOnAddress;

  /// No description provided for @actionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get actionConfirm;

  /// No description provided for @requiredMgsInputBizNameMax18.
  ///
  /// In en, this message translates to:
  /// **'The business must have at maximum 18 characters'**
  String get requiredMgsInputBizNameMax18;

  /// No description provided for @requiredMgsInputBizNameMin5.
  ///
  /// In en, this message translates to:
  /// **'The business must have at least 5 characters'**
  String get requiredMgsInputBizNameMin5;

  /// No description provided for @labelHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get labelHome;

  /// No description provided for @labelDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get labelDashboard;

  /// No description provided for @labelMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get labelMore;

  /// No description provided for @labelShowQr.
  ///
  /// In en, this message translates to:
  /// **'Show QR'**
  String get labelShowQr;

  /// No description provided for @messageQrScanClose.
  ///
  /// In en, this message translates to:
  /// **'It will close automatically in'**
  String get messageQrScanClose;

  /// No description provided for @actionDownload.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get actionDownload;

  /// No description provided for @actionShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get actionShare;

  /// No description provided for @titleMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get titleMore;

  /// No description provided for @actionViewBusiness.
  ///
  /// In en, this message translates to:
  /// **'View Business'**
  String get actionViewBusiness;

  /// No description provided for @titlePersonalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get titlePersonalInformation;

  /// No description provided for @titleSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get titleSettings;

  /// No description provided for @titleReferral.
  ///
  /// In en, this message translates to:
  /// **'Referral'**
  String get titleReferral;

  /// No description provided for @titleInvitationList.
  ///
  /// In en, this message translates to:
  /// **'Invitation List'**
  String get titleInvitationList;

  /// No description provided for @titleSendFeedback.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get titleSendFeedback;

  /// No description provided for @titleKBPRASACTermsConditions.
  ///
  /// In en, this message translates to:
  /// **'KB PRASAC Terms & Conditions'**
  String get titleKBPRASACTermsConditions;

  /// No description provided for @titleMerchantTermsConditions.
  ///
  /// In en, this message translates to:
  /// **'Merchant Terms & Conditions'**
  String get titleMerchantTermsConditions;

  /// No description provided for @titleLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get titleLogOut;

  /// No description provided for @titleChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get titleChangeLanguage;

  /// No description provided for @titleNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get titleNotifications;

  /// No description provided for @titleChangePINCode.
  ///
  /// In en, this message translates to:
  /// **'Change PIN code'**
  String get titleChangePINCode;

  /// No description provided for @titleUseFaceID.
  ///
  /// In en, this message translates to:
  /// **'Use Face ID'**
  String get titleUseFaceID;

  /// No description provided for @actionLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get actionLogOut;

  /// No description provided for @titleMgsAreYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you Sure?'**
  String get titleMgsAreYouSure;

  /// No description provided for @desMgsLogOut.
  ///
  /// In en, this message translates to:
  /// **'You want to log out from this account'**
  String get desMgsLogOut;

  /// No description provided for @msgSettingsPage.
  ///
  /// In en, this message translates to:
  /// **'Manage app setting including the app language and notification'**
  String get msgSettingsPage;

  /// No description provided for @actionScreenshot.
  ///
  /// In en, this message translates to:
  /// **'Screenshot'**
  String get actionScreenshot;

  /// No description provided for @titleSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Successful'**
  String get titleSuccessful;

  /// No description provided for @labelReceivedInto.
  ///
  /// In en, this message translates to:
  /// **'Received into'**
  String get labelReceivedInto;

  /// No description provided for @labelTransactionID.
  ///
  /// In en, this message translates to:
  /// **'Transaction ID'**
  String get labelTransactionID;

  /// No description provided for @labelTransactionRef.
  ///
  /// In en, this message translates to:
  /// **'Transaction Ref'**
  String get labelTransactionRef;

  /// No description provided for @labelSenderName.
  ///
  /// In en, this message translates to:
  /// **'Sender Name'**
  String get labelSenderName;

  /// No description provided for @labelReceivedBy.
  ///
  /// In en, this message translates to:
  /// **'Received By'**
  String get labelReceivedBy;

  /// No description provided for @labelSenderBank.
  ///
  /// In en, this message translates to:
  /// **'Sender Bank'**
  String get labelSenderBank;

  /// No description provided for @labelPaymentType.
  ///
  /// In en, this message translates to:
  /// **'Payment Type'**
  String get labelPaymentType;

  /// No description provided for @labelAllDone.
  ///
  /// In en, this message translates to:
  /// **'All Done!'**
  String get labelAllDone;

  /// No description provided for @labelChangePinSuccess.
  ///
  /// In en, this message translates to:
  /// **'We’ve changed your PIN Code'**
  String get labelChangePinSuccess;

  /// No description provided for @labelEnterYourOldPin.
  ///
  /// In en, this message translates to:
  /// **'Enter your Old PIN'**
  String get labelEnterYourOldPin;

  /// No description provided for @errorReachMaximumAttempt.
  ///
  /// In en, this message translates to:
  /// **'Sorry, you’ve reach the maximum attempt limit. Please try again later in {minute} minutes'**
  String errorReachMaximumAttempt(Object minute);

  /// No description provided for @labelPhotoSaved.
  ///
  /// In en, this message translates to:
  /// **'Photo saved'**
  String get labelPhotoSaved;

  /// No description provided for @labelShareTransaction.
  ///
  /// In en, this message translates to:
  /// **'Share transaction successful'**
  String get labelShareTransaction;

  /// No description provided for @labelDateTime.
  ///
  /// In en, this message translates to:
  /// **'Date & Time'**
  String get labelDateTime;

  /// No description provided for @actionReversal.
  ///
  /// In en, this message translates to:
  /// **'Reversal'**
  String get actionReversal;

  /// No description provided for @titleReversal.
  ///
  /// In en, this message translates to:
  /// **'Reversal'**
  String get titleReversal;

  /// No description provided for @labelAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get labelAmount;

  /// No description provided for @labelShortDescription.
  ///
  /// In en, this message translates to:
  /// **'Short description'**
  String get labelShortDescription;

  /// No description provided for @titleReversalConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Reversal Confirmation'**
  String get titleReversalConfirmation;

  /// No description provided for @labelYouAreAboutToTransferTo.
  ///
  /// In en, this message translates to:
  /// **'You are about to transfer to'**
  String get labelYouAreAboutToTransferTo;

  /// No description provided for @labelInfoReversalPaymentConfirm.
  ///
  /// In en, this message translates to:
  /// **'Your reversal transaction can not be undone once you confirm on it.'**
  String get labelInfoReversalPaymentConfirm;

  /// No description provided for @labelReceivedHistory.
  ///
  /// In en, this message translates to:
  /// **'Received History'**
  String get labelReceivedHistory;

  /// No description provided for @labelReversedFrom.
  ///
  /// In en, this message translates to:
  /// **'Reversed from'**
  String get labelReversedFrom;

  /// No description provided for @labelBusiness.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get labelBusiness;

  /// No description provided for @labelToPayer.
  ///
  /// In en, this message translates to:
  /// **'To Payer'**
  String get labelToPayer;

  /// No description provided for @labelTransferredBy.
  ///
  /// In en, this message translates to:
  /// **'Transferred By'**
  String get labelTransferredBy;

  /// No description provided for @labelAcceptedVai.
  ///
  /// In en, this message translates to:
  /// **'Accepted Vai'**
  String get labelAcceptedVai;

  /// No description provided for @actionSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get actionSignIn;

  /// No description provided for @actionVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get actionVerify;

  /// No description provided for @errorPhoneNumberInvalid.
  ///
  /// In en, this message translates to:
  /// **'Phone number is invalid'**
  String get errorPhoneNumberInvalid;

  /// No description provided for @errorVerifyAccountNumberFailed.
  ///
  /// In en, this message translates to:
  /// **'Verify account number failed. Please check and try again.'**
  String get errorVerifyAccountNumberFailed;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Timeout'**
  String get errorTimeout;

  /// No description provided for @errorConnection.
  ///
  /// In en, this message translates to:
  /// **'Connection issue'**
  String get errorConnection;

  /// No description provided for @errorPinMissMatch.
  ///
  /// In en, this message translates to:
  /// **'PIN code do not match'**
  String get errorPinMissMatch;

  /// No description provided for @errorPhoneNumberAlreadyRegistered.
  ///
  /// In en, this message translates to:
  /// **'Your phone number already registered. You can sign in now.'**
  String get errorPhoneNumberAlreadyRegistered;

  /// No description provided for @labelUseOfficialBusiness.
  ///
  /// In en, this message translates to:
  /// **'Use Official Business Name'**
  String get labelUseOfficialBusiness;

  /// No description provided for @labelUsePreferredBusiness.
  ///
  /// In en, this message translates to:
  /// **'Use Preferred Business Name'**
  String get labelUsePreferredBusiness;

  /// No description provided for @labelUseAccountSettlement.
  ///
  /// In en, this message translates to:
  /// **'Use your Account Settlement Name'**
  String get labelUseAccountSettlement;

  /// No description provided for @infoUseOfficialBusiness.
  ///
  /// In en, this message translates to:
  /// **'This option is suitable for those whose businesses have official documents.'**
  String get infoUseOfficialBusiness;

  /// No description provided for @infoUsePreferredBusiness.
  ///
  /// In en, this message translates to:
  /// **'You can use your preferred business name which doesn’t require a official documents.'**
  String get infoUsePreferredBusiness;

  /// No description provided for @infoUseAccountSettlement.
  ///
  /// In en, this message translates to:
  /// **'Your KB PRASAC account holder name will be use as a business name.'**
  String get infoUseAccountSettlement;

  /// No description provided for @pageTitleRegisterWithInviteCode.
  ///
  /// In en, this message translates to:
  /// **'Register with Invite Code'**
  String get pageTitleRegisterWithInviteCode;

  /// No description provided for @pageSubtitleRegisterWithInviteCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the code you received from your business \nowner and your phone number'**
  String get pageSubtitleRegisterWithInviteCode;

  /// No description provided for @hintFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get hintFullName;

  /// No description provided for @hintSixDigitCode.
  ///
  /// In en, this message translates to:
  /// **'6 Digit Code'**
  String get hintSixDigitCode;

  /// No description provided for @hintNationalID.
  ///
  /// In en, this message translates to:
  /// **'National ID (optional)'**
  String get hintNationalID;

  /// No description provided for @labelRegisterInviteCodeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Congrats, you’re all done. Your KB PRASAC \naccount is completed successfully.'**
  String get labelRegisterInviteCodeSuccess;

  /// No description provided for @titleProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get titleProfile;

  /// No description provided for @actionChangeProfilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change profile photo'**
  String get actionChangeProfilePhoto;

  /// No description provided for @labelProfileDetails.
  ///
  /// In en, this message translates to:
  /// **'Profile details'**
  String get labelProfileDetails;

  /// No description provided for @titleFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get titleFullName;

  /// No description provided for @titlePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get titlePhoneNumber;

  /// No description provided for @infoUpdateProfileOwnerBusiness.
  ///
  /// In en, this message translates to:
  /// **'Note: If you want to update your business information, Please come to KB PRASAC branch nearby you.'**
  String get infoUpdateProfileOwnerBusiness;

  /// No description provided for @mgsSuccessUpdateProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile picture has been changed'**
  String get mgsSuccessUpdateProfile;

  /// No description provided for @titleNationalID.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get titleNationalID;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @requiredMgs.
  ///
  /// In en, this message translates to:
  /// **'Field is required'**
  String get requiredMgs;

  /// No description provided for @titleManageBusiness.
  ///
  /// In en, this message translates to:
  /// **'Manage Business'**
  String get titleManageBusiness;

  /// No description provided for @actionSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get actionSeeAll;

  /// No description provided for @titleCurrentShop.
  ///
  /// In en, this message translates to:
  /// **'Current Shop'**
  String get titleCurrentShop;

  /// No description provided for @labelBusinessName.
  ///
  /// In en, this message translates to:
  /// **'Business Name'**
  String get labelBusinessName;

  /// No description provided for @labelSetUpNewCounter.
  ///
  /// In en, this message translates to:
  /// **'Set Up New Counter'**
  String get labelSetUpNewCounter;

  /// No description provided for @labelCounters.
  ///
  /// In en, this message translates to:
  /// **'Counters'**
  String get labelCounters;

  /// No description provided for @labelEmployees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get labelEmployees;

  /// No description provided for @actionClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get actionClose;

  /// No description provided for @actionNewCashier.
  ///
  /// In en, this message translates to:
  /// **'New Cashier'**
  String get actionNewCashier;

  /// No description provided for @actionNewSupervisor.
  ///
  /// In en, this message translates to:
  /// **'New Supervisor'**
  String get actionNewSupervisor;

  /// No description provided for @labelNoEmployeeYet.
  ///
  /// In en, this message translates to:
  /// **'No Employee Yet'**
  String get labelNoEmployeeYet;

  /// No description provided for @infoNoEmployeeYet.
  ///
  /// In en, this message translates to:
  /// **'The list of the employee will appear here'**
  String get infoNoEmployeeYet;

  /// No description provided for @mgsEmptyCounter.
  ///
  /// In en, this message translates to:
  /// **'Your list of cashier will appear here after you invited them.'**
  String get mgsEmptyCounter;

  /// No description provided for @actionAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get actionAdd;

  /// No description provided for @infoInviteCoMerchant.
  ///
  /// In en, this message translates to:
  /// **'Your list of co-merchant will appear here after you invited them.'**
  String get infoInviteCoMerchant;

  /// No description provided for @labelShops.
  ///
  /// In en, this message translates to:
  /// **'Shops'**
  String get labelShops;

  /// No description provided for @labelStaffs.
  ///
  /// In en, this message translates to:
  /// **'Staffs'**
  String get labelStaffs;

  /// No description provided for @labelListOfCoMerchant.
  ///
  /// In en, this message translates to:
  /// **'List of Co-Merchant'**
  String get labelListOfCoMerchant;

  /// No description provided for @labelBusinessInformation.
  ///
  /// In en, this message translates to:
  /// **'Business Information'**
  String get labelBusinessInformation;

  /// No description provided for @labelEditBusinessDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit Business Details'**
  String get labelEditBusinessDetails;

  /// No description provided for @labelChooseShop.
  ///
  /// In en, this message translates to:
  /// **'Choose Shop'**
  String get labelChooseShop;

  /// No description provided for @labelSetUpNewShop.
  ///
  /// In en, this message translates to:
  /// **'Set Up New Shop'**
  String get labelSetUpNewShop;

  /// No description provided for @infoUploadProfileImageSetupShop.
  ///
  /// In en, this message translates to:
  /// **'This profile image will appear when your customer make payments'**
  String get infoUploadProfileImageSetupShop;

  /// No description provided for @actionCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get actionCreate;

  /// No description provided for @labelShopName.
  ///
  /// In en, this message translates to:
  /// **'Shop Name'**
  String get labelShopName;

  /// No description provided for @requiredMgsInputShopNameMaxMin.
  ///
  /// In en, this message translates to:
  /// **'Must have from {from} to {to} character'**
  String requiredMgsInputShopNameMaxMin(Object from, Object to);

  /// No description provided for @hintSelectShopType.
  ///
  /// In en, this message translates to:
  /// **'No shop type selected'**
  String get hintSelectShopType;

  /// No description provided for @titleLinkedKBPRASACAccounts.
  ///
  /// In en, this message translates to:
  /// **'Linked KB PRASAC Accounts'**
  String get titleLinkedKBPRASACAccounts;

  /// No description provided for @infoLinkedKBPRASACAccounts.
  ///
  /// In en, this message translates to:
  /// **'Can link 2 different currency accounts'**
  String get infoLinkedKBPRASACAccounts;

  /// No description provided for @actionLink.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get actionLink;

  /// No description provided for @titleSupportedAccountType.
  ///
  /// In en, this message translates to:
  /// **'Supported Account Type'**
  String get titleSupportedAccountType;

  /// No description provided for @infoSupportedAccountType.
  ///
  /// In en, this message translates to:
  /// **'Savings Account;Unifixed Deposit Account;Flexi Growth Savings Account;Payroll Account;Digital Account'**
  String get infoSupportedAccountType;

  /// No description provided for @actionViewAccountType.
  ///
  /// In en, this message translates to:
  /// **'View Account Type'**
  String get actionViewAccountType;

  /// No description provided for @actionAddAnotherBankAccount.
  ///
  /// In en, this message translates to:
  /// **'Add Another {currency} Account'**
  String actionAddAnotherBankAccount(Object currency);

  /// No description provided for @labelYouAreAboutTo.
  ///
  /// In en, this message translates to:
  /// **'You are about to {action}'**
  String labelYouAreAboutTo(Object action);

  /// No description provided for @labelNewShop.
  ///
  /// In en, this message translates to:
  /// **'New Shop'**
  String get labelNewShop;

  /// No description provided for @labelLinkedAccount.
  ///
  /// In en, this message translates to:
  /// **'Linked Account {currency}'**
  String labelLinkedAccount(Object currency);

  /// No description provided for @labelYouAreAction.
  ///
  /// In en, this message translates to:
  /// **'You\'ve {action}'**
  String labelYouAreAction(Object action);

  /// No description provided for @labelDisableShop.
  ///
  /// In en, this message translates to:
  /// **'Disable Shop'**
  String get labelDisableShop;

  /// No description provided for @labelEditShopDetail.
  ///
  /// In en, this message translates to:
  /// **'Edit Shop Detail'**
  String get labelEditShopDetail;

  /// No description provided for @labelDeleteShop.
  ///
  /// In en, this message translates to:
  /// **'Delete Shop'**
  String get labelDeleteShop;

  /// No description provided for @labelEnableShop.
  ///
  /// In en, this message translates to:
  /// **'Enable Shop'**
  String get labelEnableShop;

  /// No description provided for @labelShop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get labelShop;

  /// No description provided for @infoDeleteShop.
  ///
  /// In en, this message translates to:
  /// **'Note: After you deleted, this shop will no longer in the system.'**
  String get infoDeleteShop;

  /// No description provided for @labelYouAreAboutToSetup.
  ///
  /// In en, this message translates to:
  /// **'You are about to setup'**
  String get labelYouAreAboutToSetup;

  /// No description provided for @infoMgsUpdateShopSuccess.
  ///
  /// In en, this message translates to:
  /// **'The shop details has been updated'**
  String get infoMgsUpdateShopSuccess;

  /// No description provided for @labelYouAreSetup.
  ///
  /// In en, this message translates to:
  /// **'You are Setup'**
  String get labelYouAreSetup;

  /// No description provided for @actionGoToEdit.
  ///
  /// In en, this message translates to:
  /// **'Go to Edit'**
  String get actionGoToEdit;

  /// No description provided for @actionMaybeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get actionMaybeLater;

  /// No description provided for @infoMgsEmptyShopName.
  ///
  /// In en, this message translates to:
  /// **'Your default shop don’t have name yet. You can update it now.'**
  String get infoMgsEmptyShopName;

  /// No description provided for @actionUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get actionUpdate;

  /// No description provided for @titleListOfCashiers.
  ///
  /// In en, this message translates to:
  /// **'List of cashiers'**
  String get titleListOfCashiers;

  /// No description provided for @hintMgsListOfCashiers.
  ///
  /// In en, this message translates to:
  /// **'Your list of cashiers will appear here after you invited them'**
  String get hintMgsListOfCashiers;

  /// No description provided for @labelCloneCounter.
  ///
  /// In en, this message translates to:
  /// **'Clone Counter'**
  String get labelCloneCounter;

  /// No description provided for @labelCounterName.
  ///
  /// In en, this message translates to:
  /// **'Counter Name'**
  String get labelCounterName;

  /// No description provided for @labelEditCounterDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit Counter Details'**
  String get labelEditCounterDetails;

  /// No description provided for @titleSetupNewCounter.
  ///
  /// In en, this message translates to:
  /// **'Setup New Counter'**
  String get titleSetupNewCounter;

  /// No description provided for @labelUnderShop.
  ///
  /// In en, this message translates to:
  /// **'Under Shop'**
  String get labelUnderShop;

  /// No description provided for @labelCounter.
  ///
  /// In en, this message translates to:
  /// **'Counter'**
  String get labelCounter;

  /// No description provided for @labelDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get labelDisabled;

  /// No description provided for @labelEnableCounter.
  ///
  /// In en, this message translates to:
  /// **'Enable Counter'**
  String get labelEnableCounter;

  /// No description provided for @labelDeleteCounter.
  ///
  /// In en, this message translates to:
  /// **'Delete Counter'**
  String get labelDeleteCounter;

  /// No description provided for @labelCounterDisabled.
  ///
  /// In en, this message translates to:
  /// **'Counter Disabled'**
  String get labelCounterDisabled;

  /// No description provided for @hintMgsCounterDisabled.
  ///
  /// In en, this message translates to:
  /// **'You can still manage things in this counter, beside this counter will stop receiving any payment.'**
  String get hintMgsCounterDisabled;

  /// No description provided for @labelEditCounterName.
  ///
  /// In en, this message translates to:
  /// **'Edit Counter Name'**
  String get labelEditCounterName;

  /// No description provided for @labelAcceptInvitation.
  ///
  /// In en, this message translates to:
  /// **'You have been invited to be cashier in {bizName}. Click Accept to become the new role.'**
  String labelAcceptInvitation(Object bizName);

  /// No description provided for @actionAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get actionAccept;

  /// No description provided for @actionLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe later'**
  String get actionLater;

  /// No description provided for @labelAcceptedBuz.
  ///
  /// In en, this message translates to:
  /// **'You’ve accepted into {bizName}'**
  String labelAcceptedBuz(Object bizName);

  /// No description provided for @labelInviteCode.
  ///
  /// In en, this message translates to:
  /// **'Invite Code'**
  String get labelInviteCode;

  /// No description provided for @labelInviteCodeInfo.
  ///
  /// In en, this message translates to:
  /// **'You have been invited to {bizName} Business. Enter the\n6 digits invite code to confirm your acceptance.'**
  String labelInviteCodeInfo(Object bizName);

  /// No description provided for @hintInviteCode.
  ///
  /// In en, this message translates to:
  /// **'6 Digit Code'**
  String get hintInviteCode;

  /// No description provided for @labelInvitationMessageInfo.
  ///
  /// In en, this message translates to:
  /// **'Manage app setting including the app language and notification'**
  String get labelInvitationMessageInfo;

  /// No description provided for @labelCurrentBusiness.
  ///
  /// In en, this message translates to:
  /// **'Current Business'**
  String get labelCurrentBusiness;

  /// No description provided for @labelOtherBusiness.
  ///
  /// In en, this message translates to:
  /// **'Other Business'**
  String get labelOtherBusiness;

  /// No description provided for @labelInviteAs.
  ///
  /// In en, this message translates to:
  /// **'Invite as a {roleName} in {bizName}'**
  String labelInviteAs(Object bizName, Object roleName);

  /// No description provided for @labelListEmpty.
  ///
  /// In en, this message translates to:
  /// **'List Empty'**
  String get labelListEmpty;

  /// No description provided for @errorInviteCodeExpired.
  ///
  /// In en, this message translates to:
  /// **'Invite code is expired'**
  String get errorInviteCodeExpired;

  /// No description provided for @titleAddSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Add New Supervisor'**
  String get titleAddSupervisor;

  /// No description provided for @titleAddCashier.
  ///
  /// In en, this message translates to:
  /// **'Add New Cashier'**
  String get titleAddCashier;

  /// No description provided for @titleAddCoMerchant.
  ///
  /// In en, this message translates to:
  /// **'Add New Co-Merchant'**
  String get titleAddCoMerchant;

  /// No description provided for @labelLinkedShop.
  ///
  /// In en, this message translates to:
  /// **'Linked Shop'**
  String get labelLinkedShop;

  /// No description provided for @labelLinkedCounter.
  ///
  /// In en, this message translates to:
  /// **'Linked Counter'**
  String get labelLinkedCounter;

  /// No description provided for @labelLinkedBusiness.
  ///
  /// In en, this message translates to:
  /// **'Linked Business'**
  String get labelLinkedBusiness;

  /// No description provided for @labelReversal.
  ///
  /// In en, this message translates to:
  /// **'Reversal'**
  String get labelReversal;

  /// No description provided for @labelReversalInfo.
  ///
  /// In en, this message translates to:
  /// **'Enable this feature allow staff can do the \nreverse payment'**
  String get labelReversalInfo;

  /// No description provided for @labelInviteConfirm.
  ///
  /// In en, this message translates to:
  /// **'You are about to invite'**
  String get labelInviteConfirm;

  /// No description provided for @labelSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Supervisor'**
  String get labelSupervisor;

  /// No description provided for @labelCashier.
  ///
  /// In en, this message translates to:
  /// **'Cashier'**
  String get labelCashier;

  /// No description provided for @labelCoMerchant.
  ///
  /// In en, this message translates to:
  /// **'Co-Merchant'**
  String get labelCoMerchant;

  /// No description provided for @labelInviteSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'You’ve invited {fullName}\nas a new {role}'**
  String labelInviteSuccessTitle(Object fullName, Object role);

  /// No description provided for @labelInviteSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Let {fullName} activate KB PRASAC \nMerchant App by sharing this invite code.'**
  String labelInviteSuccessMessage(Object fullName);

  /// No description provided for @labelExpiredIn.
  ///
  /// In en, this message translates to:
  /// **'Expires in'**
  String get labelExpiredIn;

  /// No description provided for @labelDurationInHours.
  ///
  /// In en, this message translates to:
  /// **'{duration} hours'**
  String labelDurationInHours(Object duration);

  /// No description provided for @labelChooseCounter.
  ///
  /// In en, this message translates to:
  /// **'Choose Linked Counter'**
  String get labelChooseCounter;

  /// No description provided for @titleChooseSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Choose existing supervisor'**
  String get titleChooseSupervisor;

  /// No description provided for @titleChooseCashier.
  ///
  /// In en, this message translates to:
  /// **'Choose existing cashier'**
  String get titleChooseCashier;

  /// No description provided for @labelAddNewSupervisorInfo.
  ///
  /// In en, this message translates to:
  /// **'Or add new supervisor'**
  String get labelAddNewSupervisorInfo;

  /// No description provided for @labelAddNewCashierInfo.
  ///
  /// In en, this message translates to:
  /// **'Or add new cashier'**
  String get labelAddNewCashierInfo;

  /// No description provided for @actionAddNew.
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get actionAddNew;

  /// No description provided for @labelListSupervisor.
  ///
  /// In en, this message translates to:
  /// **'List of supervisor'**
  String get labelListSupervisor;

  /// No description provided for @labelListCashiers.
  ///
  /// In en, this message translates to:
  /// **'List of cashiers'**
  String get labelListCashiers;
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
