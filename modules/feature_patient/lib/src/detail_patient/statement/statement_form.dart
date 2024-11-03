import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup statementForm() {
  return FormGroup({
    '_id': FormControl<String>(),
    'logoFile': FormControl<FileSelect>(),
    'stampFile': FormControl<FileSelect>(),
    'invoiceNumber': FormControl<String>(),
    'invoiceDate': FormControl<DateTime>(
      value: DateTime.now(),
    ),
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
  });
}
