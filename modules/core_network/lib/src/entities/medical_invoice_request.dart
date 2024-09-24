import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';

part 'medical_invoice_request.g.dart';

@CopyWith()
@JsonSerializable()
class MedicalInvoiceRequest {
  String? file;
  String? invoiceNumber;
  DateTime? invoiceDate;
  String? registrationNumber;
  String? subject;
  double? amountBilled;
  DateTime? paymentDeadline;
  String? bankTransferInformation;
  String? remarks;
  String medicalRecord;
  String user;
  String? hospitalRecord;
  List<TotalPaymentRequest>? totalPayment;
  List<ItemRequest>? item;

  MedicalInvoiceRequest({
    this.file,
    this.invoiceNumber,
    this.invoiceDate,
    this.registrationNumber,
    this.subject,
    this.amountBilled,
    this.paymentDeadline,
    this.bankTransferInformation,
    this.remarks,
    required this.medicalRecord,
    required this.user,
    this.hospitalRecord,
    this.totalPayment,
    this.item,
  });

  factory MedicalInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$MedicalInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalInvoiceRequestToJson(this);
}
