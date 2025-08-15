// Package imports:
import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup proposalEstimateForm() {
  return FormGroup({
    // 見積書関連フィールド
    '_id': FormControl<String>(),
    'logoFile': FormControl<FileSelect>(),
    'stampFile': FormControl<FileSelect>(),
    'invoiceNumber': FormControl<String>(),
    'invoiceDate': FormControl<DateTime>(
      value: DateTime.now(),
    ),
    'startDate': FormControl<DateTime>(),
    'companyName': FormControl<String>(),
    'address': FormControl<String>(),
    'telNumber': FormControl<String>(),
    'fexNumber': FormControl<String>(),
    'inCharge': FormControl<String>(),
    'totalAmount': FormControl<double>(),
    'medicalRecord': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'user': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'hospitalRecord': FormControl<String>(),
    'item': FormArray([
      FormGroup({
        '_id': FormControl<String>(),
        'itemCode': FormControl<String>(),
        'details': FormControl<String>(),
        'quantity': FormControl<double>(
          validators: [
            Validators.number,
          ],
        ),
        'unit': FormControl<String>(
          value: '式',
        ),
        'unitPrice': FormControl<double>(),
      })
    ]),
    'notes': FormArray([
      FormGroup({
        '_id': FormControl<String>(),
        'note': FormControl<String>(),
      })
    ]),
    'taxRate': FormControl<int>(),
    'taxRateOption': FormControl<bool>(
      value: false,
    ),
    'remarks': FormControl<String>(),
    
    // 提案関連フィールド
    'proposals': FormArray([
      FormGroup({
        '_id': FormControl<String>(),
        'medicalInstitution': FormControl<String>(),
        'region': FormControl<String>(),
        'treatmentType': FormControl<String>(),
        'recommendationReason': FormControl<String>(),
        'expectedTreatmentMenu': FormControl<String>(),
        'budget': FormControl<String>(),
      })
    ]),
  });
}
