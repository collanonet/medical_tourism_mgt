import 'package:reactive_forms/reactive_forms.dart';

FormGroup estimateInvoiceForm() {
  return FormGroup({
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