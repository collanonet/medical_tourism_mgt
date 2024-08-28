// Package imports:
import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup estimateInvoiceForm(
    {required String agentRecordId, required FileSelect file}) {
  return FormGroup({
    'agentRecord': FormControl<String>(value: agentRecordId),
    'uploadFile': FormControl<FileSelect>(value: file),
    'documentName': FormControl<String>(),
    'publisher': FormControl<String>(),
    'dateOfIssue': FormControl<DateTime>(),
    'dateOfPayment': FormControl<DateTime>(),
    'paymentDay': FormControl<DateTime>(),
    'methodOfPayment': FormControl<String>(),
    // Todo: if not use let remove
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
