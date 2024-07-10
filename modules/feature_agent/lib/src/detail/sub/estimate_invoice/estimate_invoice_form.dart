import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup estimateInvoiceForm() {
  return FormGroup({
    'uploadFile' : FormControl<FileSelect>(),
    'documentName' : FormControl<String>(),
    'publisher' : FormControl<String>(),
    'date_of_issue' : FormControl<DateTime>(),
    'date_of_payment' : FormControl<DateTime>(),
    'payment_day' : FormControl<DateTime>(),
    'method_of_payment' : FormControl<String>(),
    'estimateInvoice': FormGroup({
      '_id': FormControl<String?>(),
      'estimateInvoiceDate': FormControl<DateTime>(
        validators: [Validators.required],
      ),
      'estimateInvoiceType': FormControl<String>(),
      'estimateInvoicePeriod': FormControl<String>(),
      'estimateInvoiceEndDate': FormControl<DateTime>(),
      'estimateInvoiceStatus': FormControl<String>(),
      'estimateInvoiceMemo': FormControl<String>(),
    }),
  });
}