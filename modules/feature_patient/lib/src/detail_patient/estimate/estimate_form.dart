import 'package:reactive_forms/reactive_forms.dart';

FormGroup estimateForm() {
  return FormGroup({
    'quotationNumber': FormControl<String>(),
    'quotationDate': FormControl<DateTime>(
      value: DateTime.now(),
    ),
    'registrationNumber': FormControl<String>(),
    'subject': FormControl<String>(),
    'totalAmount': FormControl<double>(),
    'validityPeriod': FormControl<DateTime>(
      value: DateTime.now(),
    ),
    'remarks': FormControl<String>(),
    'medicalRecord': FormControl<String>(
      validators: [Validators.required],
    ),
    'user': FormControl<String>(
      validators: [Validators.required],
    ),
    'hospitalRecord': FormControl<String>(),
    'totalPayment': FormArray([
      FormGroup({
        'taxRate': FormControl<double>(),
        'amountExcludingTaxInYen': FormControl<double>(),
        'consumptionTaxAmountInYen': FormControl<double>(),
      })
    ]),
    'item': FormArray([
      FormGroup({
        'transactionDate': FormControl<DateTime>(
          value: DateTime.now(),),
        'details': FormControl<String>(),
        'quantity': FormControl<double>(),
        'unit': FormControl<String>(),
        'unitPrice': FormControl<double>(),
        'amount': FormControl<double>(),
        'taxRate': FormControl<double>(),
      })
    ]),
  });
}
