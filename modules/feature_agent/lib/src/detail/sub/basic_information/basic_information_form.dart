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
    'transactionStartDate': FormControl<DateTime>(
      validators: [
        Validators.pattern(
          r'^\d(4)\/(0?(1-9)|1(012))\/(0? (1-9)|(12)(0-9)|3(01))$',
        ),
      ],
    ),
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
        'fullNameRomanji': FormControl<String>(
          validators: [Validators.required],
        ),
        'fullNameChineseKanjiVietnameseNotation': FormControl<String>(),
        'fullNameJapaneseKanjiChineseOnly': FormControl<String>(),
        'fullNameKana': FormControl<String>(),
        'phoneNumber': FormControl<String>(
          validators: [Validators.required],
        ),
        'email': FormControl<String>(
          validators: [Validators.required],
        ),
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
