import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medical_invoice_request.g.dart';

@CopyWith()
@JsonSerializable()
class MedicalInvoiceRequest {
  String? logoFile;
  String? stampFile;
  bool? type;
  String? fileNamePdfEN;
  String? fileNamePdfJP;
  String? fileNamePdfVN;
  String? fileNamePdfZH;
  String? fileNamePdfZHTW;
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
    this.logoFile,
    this.stampFile,
    this.type,
    this.fileNamePdfEN,
    this.fileNamePdfJP,
    this.fileNamePdfVN,
    this.fileNamePdfZH,
    this.fileNamePdfZHTW,
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

@JsonSerializable()
class TotalPaymentRequest {
  double? taxRate;
  double? amountExcludingTaxInYen;
  double? consumptionTaxAmountInYen;

  TotalPaymentRequest({
    this.taxRate,
    this.amountExcludingTaxInYen,
    this.consumptionTaxAmountInYen,
  });

  factory TotalPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$TotalPaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TotalPaymentRequestToJson(this);
}

@JsonSerializable()
class ItemRequest {
  DateTime? transactionDate;
  String? details;
  double? quantity;
  String? unit;
  double? unitPrice;
  double? amount;
  double? taxRate;

  ItemRequest({
    this.transactionDate,
    this.details,
    this.quantity,
    this.unit,
    this.unitPrice,
    this.amount,
    this.taxRate,
  });

  factory ItemRequest.fromJson(Map<String, dynamic> json) =>
      _$ItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ItemRequestToJson(this);
}
