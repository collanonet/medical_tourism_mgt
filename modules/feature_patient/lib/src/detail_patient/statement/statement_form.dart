import 'package:reactive_forms/reactive_forms.dart';

FormGroup statementForm() {
  return FormGroup({
    'file': FormControl<String>(),
    'invoiceNumber': FormControl<String>(),
    'invoiceDate': FormControl<DateTime>(),
    'registrationNumber': FormControl<String>(),
    'subject': FormControl<String>(),
    'amountBilled': FormControl<String>(),
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
        'taxRate': FormControl<String>(),
        'amountExcludingTaxInYen': FormControl<String>(),
        'consumptionTaxAmountInYen': FormControl<String>(),
      })
    ]),
    'item': FormArray([
      FormGroup({
        'transactionDate': FormControl<DateTime>(),
        'details': FormControl<String>(),
        'quantity': FormControl<String>(),
        'unit': FormControl<String>(),
        'unitPrice': FormControl<String>(),
        'amount': FormControl<String>(),
        'taxRate': FormControl<String>(),
      })
    ]),
  });
}

