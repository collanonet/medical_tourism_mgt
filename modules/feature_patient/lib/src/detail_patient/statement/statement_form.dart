import 'package:reactive_forms/reactive_forms.dart';

FormGroup statementForm() {
  return FormGroup({
    'file': FormControl<String>(),
    'invoiceNumber': FormControl<String>(),
    'invoiceDate': FormControl<DateTime>(
      value: DateTime.now(),
    ),
    'registrationNumber': FormControl<String>(),
    'subject': FormControl<String>(),
    'amountBilled': FormControl<double>(
      validators: [
        Validators.number,
      ],
    ),
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
        'taxRate': FormControl<double>(
          validators: [
            Validators.number,
          ],
        ),
        'amountExcludingTaxInYen': FormControl<double>(
          validators: [
            Validators.number,
          ],
        ),
        'consumptionTaxAmountInYen': FormControl<double>(
          validators: [
            Validators.number,
          ],
        ),
      })
    ]),
    'item': FormArray([
      FormGroup({
        'transactionDate': FormControl<DateTime>(
          value: DateTime.now(),
        ),
        'details': FormControl<String>(),
        'quantity': FormControl<double>(
          validators: [
            Validators.number,
          ],
        ),
        'unit': FormControl<String>(),
        'unitPrice': FormControl<double>(
          validators: [
            Validators.number,
          ],
        ),
        'amount': FormControl<double>(
          validators: [
            Validators.number,
          ],
        ),
        'taxRate': FormControl<double>(
          validators: [
            Validators.number,
          ],
        ),
      })
    ]),
  });
}
