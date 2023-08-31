import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get pageTitleLogin => 'Log In';

  @override
  String get pageSubtitleLogin => 'Enter your phone number that registered with a PIN';

  @override
  String get pageTitleQrScan => 'Total to Pay';

  @override
  String get actionLogin => 'Login';

  @override
  String get pageTitlePhoneNumber => 'Phone Number';

  @override
  String get pageSubtitlePhoneNumber => 'Enter your phone number that registered with \nKB PRASAC Accounut';

  @override
  String get labelPhoneNumber => 'Phone Number';

  @override
  String get hintReferralCode => 'Referral code (optional)';

  @override
  String get actionContinue => 'Continue';

  @override
  String get pageTitleVerifyCode => 'Verify Code';

  @override
  String pageSubtitleVerifyCode(Object phone_number) {
    return 'Enter the code we sent to $phone_number';
  }

  @override
  String labelResendOtpAgainIn(Object seconds) {
    return 'Resend code in $seconds';
  }

  @override
  String get actionResendCode => 'Resend code';

  @override
  String get errorOtpInvalid => 'Incorrect code! Please try again.';

  @override
  String get actionOk => 'Ok';

  @override
  String get pageTitleForgetPin => 'Forget PIN';

  @override
  String get pageSubtitleForgetPin => 'Enter your phone number that registered with your PIN Code';

  @override
  String get labelForgetPin => 'Forget PIN?';

  @override
  String get labelEnterNewPin => 'Enter New PIN';

  @override
  String get labelEnterYourPin => 'Enter Your PIN';

  @override
  String get labelConfirmPin => 'Confirm Your new PIN';

  @override
  String get page_account_number_title => 'Account Number';

  @override
  String get page_account_number_subtitle => 'Enter your account number on customer card';

  @override
  String get label_account_number => 'Account Number';

  @override
  String get page_scan_card_title => 'Scan Card';

  @override
  String get label_scan_card_info => 'Make sure the front of your account card is in frame';

  @override
  String get errorUnknown => 'Something went wrong';

  @override
  String errorPinFailedAttempt(Object attempt_left) {
    return 'Incorrect PIN: $attempt_left more attempts left';
  }

  @override
  String get actionGetStarted => 'Get Started';

  @override
  String get titleHelpAndSupport => 'Help & Support';

  @override
  String get messageInfoHelpAndSupport => 'If you have any concerns or request check out the list of informations below';

  @override
  String get labelKHQRMaterialRequest => 'KHQR Material Request';

  @override
  String get labelContactCallCenter => 'Contact Call Center';

  @override
  String get labelFAQs => 'FAQs';

  @override
  String get labelMessenger => 'Messenger';

  @override
  String get labelTelegram => 'Telegram';

  @override
  String get labelBizName => 'Business Name';

  @override
  String get messageLabelBizNam => 'Must have from 5 to 18 character and the same as official supported document';

  @override
  String get labelMerchantType => 'Merchant Type';

  @override
  String get labelBusinessCategory => 'Business Category';

  @override
  String get labelShopType => 'Shop Type';

  @override
  String get labelCommentToKBPRASACStaff => 'Comment to KB PRASAC staff(optional)';

  @override
  String get labelSupportedDocument => 'Supported Document (optional)';

  @override
  String get hintMessageSupportedDocument => 'Can be upload multiple documents';

  @override
  String get actionUpload => 'Upload';

  @override
  String get labelProvinceCity => 'Province/City';

  @override
  String get labelDistrict => 'District';

  @override
  String get labelCommune => 'Commune';

  @override
  String get labelVillage => 'Village';

  @override
  String get labelAddressLine => 'Address Line';

  @override
  String get hintAddressLine => 'House number, street no.';

  @override
  String get labelLocation => 'Locations';

  @override
  String get labelPinOnAddress => 'Pin on Address';

  @override
  String get actionDone => 'Done';

  @override
  String get titleSetupNewBusiness => 'Setup New Business';

  @override
  String get requiredMgsInputBizName => 'The business must not be empty';

  @override
  String get maximum => 'maximum';

  @override
  String get least => 'least';

  @override
  String requiredMgsInputBizNameMaxMin(Object length, Object maximum) {
    return 'The business must have at $maximum $length characters';
  }

  @override
  String get requiredMgsSelectMerchantType => 'The merchant type is required';

  @override
  String get requiredMgsSelectBizCategory => 'The business category is required';

  @override
  String get requiredMgsSelectShopType => 'The shop type is required';

  @override
  String get requiredMgsSelectProvinceCity => 'The province or city is required';

  @override
  String get requiredMgsSelectDistrict => 'The district is required';

  @override
  String get requiredMgsSelectCommune => 'The commune is required';

  @override
  String get requiredMgsSelectVillage => 'The village is required';

  @override
  String get errorMgsUnableSelectThisImage => 'Unable select this image, Please try other image';

  @override
  String get titleCropImage => 'Crop Image';

  @override
  String get titleSupportedDocument => 'Supported Document';

  @override
  String get descriptionSupportDocumentH => 'Document support (jpg, png, pdf)';

  @override
  String get descriptionSupportDocumentS => 'Memorandum and Articles of Association;Certificate of Incorporation;Approval Letter to Operate Business Issued by the Concerned Ministry or Related Authority;Photo of the business;Business patent;Business license';

  @override
  String get actionGoToHomePage => 'Go to Homepage';

  @override
  String get titleSuccess => 'Success!';

  @override
  String get labelNewUser => 'New User';

  @override
  String get labelIHaveReadAndAcceptThe => 'I have read and accept the';

  @override
  String get labelKBPRASACMerchantAgreement => 'KB PRASAC Merchant Agreement';

  @override
  String get labelIHaveReadAndAcceptToAllOfTheAbove => 'I have read and accept to all of the above';

  @override
  String get actionOpenNewAccountInKBPRASACMobileApp => 'Open new account in KB PRASAC Mobile App';

  @override
  String get labelNoKBPRASACAccount => 'No KB PRASAC account?';

  @override
  String get actionRegisterWithInviteCode => 'Register with Invite Code';

  @override
  String get actionRegisterWithKBPRASACAccount => 'Register with KB PRASAC Account';

  @override
  String get actionImNewUserToKBPRASACMerchant => 'I’m new user to KB PRASAC Merchant';

  @override
  String get mgsBizCreateSuccess => 'Congrats, you’re all done. Your KB PRASAC account is completed successfully.';

  @override
  String get labelListOfShops => 'List of Shops';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionTakephoto => 'Take photo';

  @override
  String get actionChoosefromphotos => 'Choose from photos';

  @override
  String get labelTermsConditionsandMerchantAgreement => 'Terms & Conditions and Merchant Agreement';

  @override
  String get titleSetupBusinessInfo => 'Setup Business Info';

  @override
  String get actionPickLocation => 'Pick Location';

  @override
  String get titlePinOnAddress => 'Pin on Address';

  @override
  String get actionConfirm => 'Confirm';

  @override
  String get requiredMgsInputBizNameMax18 => 'The business must have at maximum 18 characters';

  @override
  String get requiredMgsInputBizNameMin5 => 'The business must have at least 5 characters';

  @override
  String get labelHome => 'Home';

  @override
  String get labelDashboard => 'Dashboard';

  @override
  String get labelMore => 'More';

  @override
  String get labelShowQr => 'Show QR';

  @override
  String get messageQrScanClose => 'It will close automatically in';

  @override
  String get actionDownload => 'Download';

  @override
  String get actionShare => 'Share';

  @override
  String get titleMore => 'More';

  @override
  String get actionViewBusiness => 'View Business';

  @override
  String get titlePersonalInformation => 'Personal Information';

  @override
  String get titleSettings => 'Settings';

  @override
  String get titleReferral => 'Referral';

  @override
  String get titleInvitationList => 'Invitation List';

  @override
  String get titleSendFeedback => 'Send Feedback';

  @override
  String get titleKBPRASACTermsConditions => 'KB PRASAC Terms & Conditions';

  @override
  String get titleMerchantTermsConditions => 'Merchant Terms & Conditions';

  @override
  String get titleLogOut => 'Log Out';

  @override
  String get titleChangeLanguage => 'Change Language';

  @override
  String get titleNotifications => 'Notifications';

  @override
  String get titleChangePINCode => 'Change PIN code';

  @override
  String get titleUseFaceID => 'Use Face ID';

  @override
  String get actionLogOut => 'Log Out';

  @override
  String get titleMgsAreYouSure => 'Are you Sure?';

  @override
  String get desMgsLogOut => 'You want to log out from this account';

  @override
  String get msgSettingsPage => 'Manage app setting including the app language and notification';

  @override
  String get actionScreenshot => 'Screenshot';

  @override
  String get titleSuccessful => 'Successful';

  @override
  String get labelReceivedInto => 'Received into';

  @override
  String get labelTransactionID => 'Transaction ID';

  @override
  String get labelTransactionRef => 'Transaction Ref';

  @override
  String get labelSenderName => 'Sender Name';

  @override
  String get labelReceivedBy => 'Received By';

  @override
  String get labelSenderBank => 'Sender Bank';

  @override
  String get labelPaymentType => 'Payment Type';

  @override
  String get labelAllDone => 'All Done!';

  @override
  String get labelChangePinSuccess => 'We’ve changed your PIN Code';

  @override
  String get labelEnterYourOldPin => 'Enter your Old PIN';

  @override
  String errorReachMaximumAttempt(Object minute) {
    return 'Sorry, you’ve reach the maximum attempt limit. Please try again later in $minute minutes';
  }

  @override
  String get labelPhotoSaved => 'Photo saved';

  @override
  String get labelShareTransaction => 'Share transaction successful';

  @override
  String get labelDateTime => 'Date & Time';

  @override
  String get actionReversal => 'Reversal';

  @override
  String get titleReversal => 'Reversal';

  @override
  String get labelAmount => 'Amount';

  @override
  String get labelShortDescription => 'Short description';

  @override
  String get titleReversalConfirmation => 'Reversal Confirmation';

  @override
  String get labelYouAreAboutToTransferTo => 'You are about to transfer to';

  @override
  String get labelInfoReversalPaymentConfirm => 'Your reversal transaction can not be undone once you confirm on it.';

  @override
  String get labelReceivedHistory => 'Received History';

  @override
  String get labelReversedFrom => 'Reversed from';

  @override
  String get labelBusiness => 'Business';

  @override
  String get labelToPayer => 'To Payer';

  @override
  String get labelTransferredBy => 'Transferred By';

  @override
  String get labelAcceptedVai => 'Accepted Vai';

  @override
  String get actionSignIn => 'Sign In';

  @override
  String get actionVerify => 'Verify';

  @override
  String get errorPhoneNumberInvalid => 'Phone number is invalid';

  @override
  String get errorVerifyAccountNumberFailed => 'Verify account number failed. Please check and try again.';

  @override
  String get errorTimeout => 'Timeout';

  @override
  String get errorConnection => 'Connection issue';

  @override
  String get errorPinMissMatch => 'PIN code do not match';

  @override
  String get errorPhoneNumberAlreadyRegistered => 'Your phone number already registered. You can sign in now.';

  @override
  String get labelUseOfficialBusiness => 'Use Official Business Name';

  @override
  String get labelUsePreferredBusiness => 'Use Preferred Business Name';

  @override
  String get labelUseAccountSettlement => 'Use your Account Settlement Name';

  @override
  String get infoUseOfficialBusiness => 'This option is suitable for those whose businesses have official documents.';

  @override
  String get infoUsePreferredBusiness => 'You can use your preferred business name which doesn’t require a official documents.';

  @override
  String get infoUseAccountSettlement => 'Your KB PRASAC account holder name will be use as a business name.';

  @override
  String get pageTitleRegisterWithInviteCode => 'Register with Invite Code';

  @override
  String get pageSubtitleRegisterWithInviteCode => 'Enter the code you received from your business \nowner and your phone number';

  @override
  String get hintFullName => 'Full name';

  @override
  String get hintSixDigitCode => '6 Digit Code';

  @override
  String get hintNationalID => 'National ID (optional)';

  @override
  String get labelRegisterInviteCodeSuccess => 'Congrats, you’re all done. Your KB PRASAC \naccount is completed successfully.';

  @override
  String get titleProfile => 'Profile';

  @override
  String get actionChangeProfilePhoto => 'Change profile photo';

  @override
  String get labelProfileDetails => 'Profile details';

  @override
  String get titleFullName => 'Full Name';

  @override
  String get titlePhoneNumber => 'Phone Number';

  @override
  String get infoUpdateProfileOwnerBusiness => 'Note: If you want to update your business information, Please come to KB PRASAC branch nearby you.';

  @override
  String get mgsSuccessUpdateProfile => 'Profile picture has been changed';

  @override
  String get titleNationalID => 'National ID';

  @override
  String get actionSave => 'Save';

  @override
  String get requiredMgs => 'Field is required';

  @override
  String get titleManageBusiness => 'Manage Business';

  @override
  String get actionSeeAll => 'See All';

  @override
  String get titleCurrentShop => 'Current Shop';

  @override
  String get labelBusinessName => 'Business Name';

  @override
  String get labelSetUpNewCounter => 'Set Up New Counter';

  @override
  String get labelCounters => 'Counters';

  @override
  String get labelEmployees => 'Employees';

  @override
  String get actionClose => 'Close';

  @override
  String get actionNewCashier => 'New Cashier';

  @override
  String get actionNewSupervisor => 'New Supervisor';

  @override
  String get labelNoEmployeeYet => 'No Employee Yet';

  @override
  String get infoNoEmployeeYet => 'The list of the employee will appear here';

  @override
  String get mgsEmptyCounter => 'Your list of cashier will appear here after you invited them.';

  @override
  String get actionAdd => 'Add';

  @override
  String get infoInviteCoMerchant => 'Your list of co-merchant will appear here after you invited them.';

  @override
  String get labelShops => 'Shops';

  @override
  String get labelStaffs => 'Staffs';

  @override
  String get labelListOfCoMerchant => 'List of Co-Merchant';

  @override
  String get labelBusinessInformation => 'Business Information';

  @override
  String get labelEditBusinessDetails => 'Edit Business Details';

  @override
  String get labelChooseShop => 'Choose Shop';

  @override
  String get labelSetUpNewShop => 'Set Up New Shop';

  @override
  String get infoUploadProfileImageSetupShop => 'This profile image will appear when your customer make payments';

  @override
  String get actionCreate => 'Create';

  @override
  String get labelShopName => 'Shop Name';

  @override
  String requiredMgsInputShopNameMaxMin(Object from, Object to) {
    return 'Must have from $from to $to character';
  }

  @override
  String get hintSelectShopType => 'No shop type selected';

  @override
  String get titleLinkedKBPRASACAccounts => 'Linked KB PRASAC Accounts';

  @override
  String get infoLinkedKBPRASACAccounts => 'Can link 2 different currency accounts';

  @override
  String get actionLink => 'Link';

  @override
  String get titleSupportedAccountType => 'Supported Account Type';

  @override
  String get infoSupportedAccountType => 'Savings Account;Unifixed Deposit Account;Flexi Growth Savings Account;Payroll Account;Digital Account';

  @override
  String get actionViewAccountType => 'View Account Type';

  @override
  String actionAddAnotherBankAccount(Object currency) {
    return 'Add Another $currency Account';
  }

  @override
  String labelYouAreAboutTo(Object action) {
    return 'You are about to $action';
  }

  @override
  String get labelNewShop => 'New Shop';

  @override
  String labelLinkedAccount(Object currency) {
    return 'Linked Account $currency';
  }

  @override
  String labelYouAreAction(Object action) {
    return 'You\'ve $action';
  }

  @override
  String get labelDisableShop => 'Disable Shop';

  @override
  String get labelEditShopDetail => 'Edit Shop Detail';

  @override
  String get labelDeleteShop => 'Delete Shop';

  @override
  String get labelEnableShop => 'Enable Shop';

  @override
  String get labelShop => 'Shop';

  @override
  String get infoDeleteShop => 'Note: After you deleted, this shop will no longer in the system.';

  @override
  String get labelYouAreAboutToSetup => 'You are about to setup';

  @override
  String get infoMgsUpdateShopSuccess => 'The shop details has been updated';

  @override
  String get labelYouAreSetup => 'You are Setup';

  @override
  String get actionGoToEdit => 'Go to Edit';

  @override
  String get actionMaybeLater => 'Maybe Later';

  @override
  String get infoMgsEmptyShopName => 'Your default shop don’t have name yet. You can update it now.';

  @override
  String get actionUpdate => 'Update';

  @override
  String get titleListOfCashiers => 'List of cashiers';

  @override
  String get hintMgsListOfCashiers => 'Your list of cashiers will appear here after you invited them';

  @override
  String get labelCloneCounter => 'Clone Counter';

  @override
  String get labelCounterName => 'Counter Name';

  @override
  String get labelEditCounterDetails => 'Edit Counter Details';

  @override
  String get titleSetupNewCounter => 'Setup New Counter';

  @override
  String get labelUnderShop => 'Under Shop';

  @override
  String get labelCounter => 'Counter';

  @override
  String get labelDisabled => 'Disabled';

  @override
  String get labelEnableCounter => 'Enable Counter';

  @override
  String get labelDeleteCounter => 'Delete Counter';

  @override
  String get labelCounterDisabled => 'Counter Disabled';

  @override
  String get hintMgsCounterDisabled => 'You can still manage things in this counter, beside this counter will stop receiving any payment.';

  @override
  String get labelEditCounterName => 'Edit Counter Name';

  @override
  String labelAcceptInvitation(Object bizName) {
    return 'You have been invited to be cashier in $bizName. Click Accept to become the new role.';
  }

  @override
  String get actionAccept => 'Accept';

  @override
  String get actionLater => 'Maybe later';

  @override
  String labelAcceptedBuz(Object bizName) {
    return 'You’ve accepted into $bizName';
  }

  @override
  String get labelInviteCode => 'Invite Code';

  @override
  String labelInviteCodeInfo(Object bizName) {
    return 'You have been invited to $bizName Business. Enter the\n6 digits invite code to confirm your acceptance.';
  }

  @override
  String get hintInviteCode => '6 Digit Code';

  @override
  String get labelInvitationMessageInfo => 'Manage app setting including the app language and notification';

  @override
  String get labelCurrentBusiness => 'Current Business';

  @override
  String get labelOtherBusiness => 'Other Business';

  @override
  String labelInviteAs(Object bizName, Object roleName) {
    return 'Invite as a $roleName in $bizName';
  }

  @override
  String get labelListEmpty => 'List Empty';

  @override
  String get errorInviteCodeExpired => 'Invite code is expired';

  @override
  String get titleAddSupervisor => 'Add New Supervisor';

  @override
  String get titleAddCashier => 'Add New Cashier';

  @override
  String get titleAddCoMerchant => 'Add New Co-Merchant';

  @override
  String get labelLinkedShop => 'Linked Shop';

  @override
  String get labelLinkedCounter => 'Linked Counter';

  @override
  String get labelLinkedBusiness => 'Linked Business';

  @override
  String get labelReversal => 'Reversal';

  @override
  String get labelReversalInfo => 'Enable this feature allow staff can do the \nreverse payment';

  @override
  String get labelInviteConfirm => 'You are about to invite';

  @override
  String get labelSupervisor => 'Supervisor';

  @override
  String get labelCashier => 'Cashier';

  @override
  String get labelCoMerchant => 'Co-Merchant';

  @override
  String labelInviteSuccessTitle(Object fullName, Object role) {
    return 'You’ve invited $fullName\nas a new $role';
  }

  @override
  String labelInviteSuccessMessage(Object fullName) {
    return 'Let $fullName activate KB PRASAC \nMerchant App by sharing this invite code.';
  }

  @override
  String get labelExpiredIn => 'Expires in';

  @override
  String labelDurationInHours(Object duration) {
    return '$duration hours';
  }

  @override
  String get labelChooseCounter => 'Choose Linked Counter';

  @override
  String get titleChooseSupervisor => 'Choose existing supervisor';

  @override
  String get titleChooseCashier => 'Choose existing cashier';

  @override
  String get labelAddNewSupervisorInfo => 'Or add new supervisor';

  @override
  String get labelAddNewCashierInfo => 'Or add new cashier';

  @override
  String get actionAddNew => 'Add New';

  @override
  String get labelListSupervisor => 'List of supervisor';

  @override
  String get labelListCashiers => 'List of cashiers';
}
