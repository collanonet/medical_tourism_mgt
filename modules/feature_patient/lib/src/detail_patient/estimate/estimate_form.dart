import 'package:reactive_forms/reactive_forms.dart';

FormGroup estimateForm() {
  return FormGroup({
    'quotationNumber': FormControl<String>(),
    'quotationDate': FormControl<DateTime>(
      value: DateTime.now(),
    ),
    'registrationNumber': FormControl<String>(),
    'subject': FormControl<String>(),
    'totalAmount': FormControl<double>(
      validators: [
        Validators.number,
      ],
    ),
    'validityPeriod': FormControl<DateTime>(
      value: DateTime.now(),
    ),
    'remarks': FormControl<String>(),
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
