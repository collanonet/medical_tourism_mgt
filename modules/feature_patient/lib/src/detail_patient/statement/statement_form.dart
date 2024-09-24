import 'package:reactive_forms/reactive_forms.dart';

FormGroup statementForm() {
  return FormGroup({
    'file': FormControl<String>(),
    'invoiceNumber': FormControl<String>(),
    'invoiceDate': FormControl<DateTime>(),
    'registrationNumber': FormControl<String>(),
    'subject': FormControl<String>(),
    'amountBilled': FormControl<double>(),
    'paymentDeadline': FormControl<DateTime>(),
    'bankTransferInformation': FormControl<String>(),
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
        'transactionDate': FormControl<DateTime>(),
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

