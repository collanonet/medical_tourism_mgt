import 'package:reactive_forms/reactive_forms.dart';

FormGroup formBasicInformation() {
  return FormGroup({
    'id': FormControl<String>(),
    'memo': FormControl<String>(),
    'companyName': FormControl<String>(
      validators: [Validators.required],
    ),
    'nameKana': FormControl<String>(
      validators: [Validators.required],
    ),
    'postalCode': FormControl<String>(),
    'address': FormControl<String>(),
    'area': FormControl<String>(),
    'phoneNumber': FormControl<String>(),
    'transactionStartDate': FormControl<DateTime>(),
    'referralCommissions': FormArray([
      FormGroup({
        'id': FormControl<String>(),
        'referralCommissionName': FormControl<String>(),
        'referralCommission': FormControl<int>(),
      }),
    ]),
    'howToMainPayment': FormControl<String>(),
    'pastCasesNumber': FormControl<int>(),
    'manager': FormArray([
      FormGroup({
        'id': FormControl<String>(),
        'nameCardDragDrop': FormControl<String>(),
        'departmentName': FormControl<String>(),
        'fullNameRomanji': FormControl<String>(),
        'fullNameChineseKanjiVietnameseNotation': FormControl<String>(),
        'fullNameJapaneseKanjiChineseOnly': FormControl<String>(),
        'fullNameKana': FormControl<String>(),
        'phoneNumber': FormControl<String>(),
        'email': FormControl<String>(),
        'contactMethods': FormArray([
          FormGroup({
            'id': FormControl<String>(),
            'howToContact': FormControl<String>(),
            'howToContactQrCode': FormControl<String>(),
          }),
        ]),
      }),
    ]),
  });
}
