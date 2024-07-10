import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup estimateInvoiceForm({required String agentRecordId}) {
  return FormGroup({
    'agentRecord': FormControl<String>(value: agentRecordId),
    'uploadFile': FormControl<FileSelect>(),
    'documentName': FormControl<String>(),
    'publisher': FormControl<String>(),
    'dateOfIssue': FormControl<DateTime>(),
    'dateOfPayment': FormControl<DateTime>(),
    'paymentDay': FormControl<DateTime>(),
    'methodOfPayment': FormControl<String>(),
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
