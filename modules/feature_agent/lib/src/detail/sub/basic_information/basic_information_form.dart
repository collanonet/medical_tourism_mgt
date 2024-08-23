import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formBasicInformation() {
  return FormGroup({
    'basicInformationAgent': FormGroup({
      '_id': FormControl<String>(),
      'memo': FormControl<String>(
        value: '',
      ),
      'companyName': FormControl<String>(
        validators: [Validators.required],
      ),
      'nameKana': FormControl<String>(
        validators: [Validators.required],
      ),
      'postalCode': FormControl<String>(
        value: '',
      ),
      'address': FormControl<String>(
        value: '',
      ),
      'area': FormControl<String>(
        value: '',
      ),
      'phoneNumber': FormControl<String>(
        value: '',
      ),
      'transactionStartDate': FormControl<DateTime>(
        value: DateTime.now(),
      ),
      'referralCommissions': FormArray([
        FormGroup({
          '_id': FormControl<String>(),
          'referralCommissionName': FormControl<String>(),
          'referralCommission': FormControl<int>(),
        }),
      ]),
      'howToMainPayment': FormControl<String>(
        value: '',
      ),
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
        'phoneNumber': FormControl<String>(),
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
