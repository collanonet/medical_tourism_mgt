import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formBasicInformation() {
  return FormGroup({
    'basicInformationAgent': FormGroup({
      '_id': FormControl<String>(),
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
      'phoneNumber': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      'transactionStartDate': FormControl<DateTime>(
        validators: [
          Validators.required,
        ],
      ),
      'referralCommissions': FormArray([
        FormGroup({
          '_id': FormControl<String>(),
          'referralCommissionName': FormControl<String>(),
          'referralCommission': FormControl<int>(),
        }),
      ]),
      'howToMainPayment': FormControl<String>(),
      'pastCasesNumber': FormControl<int>(),
    }),
    'manager': FormArray([
      FormGroup({
        '_id': FormControl<String>(),
        'nameCardDragDrop': FormControl<FileSelect>(),
        'departmentName': FormControl<String>(),
        'fullNameRomanji': FormControl<String>(
          validators: [Validators.required],
        ),
        'fullNameChineseKanjiVietnameseNotation': FormControl<String>(),
        'fullNameJapaneseKanjiChineseOnly': FormControl<String>(),
        'fullNameKana': FormControl<String>(),
        'phoneNumber': FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        'email': FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        'contactMethods': FormArray([
          FormGroup({
            '_id': FormControl<String>(),
            'howToContact': FormControl<String>(),
            'howToContactQrCode': FormControl<String>(),
          }),
        ]),
      }),
    ]),
  });
}
