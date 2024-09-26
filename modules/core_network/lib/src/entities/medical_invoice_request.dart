import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';

part 'medical_invoice_request.g.dart';

@CopyWith()
@JsonSerializable()
class MedicalInvoiceRequest {
  String? fileName;
  String? fileNameExcel;
  String? invoiceNumber;
  DateTime? invoiceDate;
  String? contact;
  String? registrationNumber;
  String? subject;
  double? amountBilled;
  DateTime? paymentDeadline;
  String? bankTransferInformation;
  String? remarks;
  String medicalRecord;
  String? user;
  String patient;
  String? hospitalRecord;
  List<TotalPaymentRequest>? totalPayment;
  List<ItemRequest>? item;

  MedicalInvoiceRequest({
    this.fileName,
    this.fileNameExcel,
    this.invoiceNumber,
    this.invoiceDate,
    this.contact,
    this.registrationNumber,
    this.subject,
    this.amountBilled,
    this.paymentDeadline,
    this.bankTransferInformation,
    this.remarks,
    required this.medicalRecord,
    this.user,
    required this.patient,
    this.hospitalRecord,
    this.totalPayment,
    this.item,
  });

  factory MedicalInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$MedicalInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalInvoiceRequestToJson(this);
}
