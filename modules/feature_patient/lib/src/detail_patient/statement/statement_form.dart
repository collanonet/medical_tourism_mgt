import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup statementForm() {
  return FormGroup({
    '_id': FormControl<String>(),
    'logoFile' : FormControl<FileSelect>(),
    'stampFile' : FormControl<FileSelect>(),
    'invoiceNumber': FormControl<String>(),
    'invoiceDate': FormControl<DateTime>(
      value: DateTime.now(),
    ),
    'contact': FormControl<String>(),
    'registrationNumber': FormControl<String>(),
    'subject': FormControl<String>(),
    'amountBilled': FormControl<double>(
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
        '_id': FormControl<String>(),
        'taxRate': FormControl<double>(
          validators: [
            Validators.number,
          ],
        ),
        'amountExcludingTaxInYen': FormControl<double>(
        ),
        'consumptionTaxAmountInYen': FormControl<double>(
        ),
      })
    ]),
    'item': FormArray([
      FormGroup({
        '_id': FormControl<String>(),
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

        ),
        'amount': FormControl<double>(

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
