import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medical_quotation_request.g.dart';

@CopyWith()
@JsonSerializable()
class MedicalQuotationRequest {
  String? fileName;
  String? quotationNumber;
  DateTime? quotationDate;
  String? contact;
  String? registrationNumber;
  String? subject;
  double? totalAmount;
  DateTime? validityPeriod;
  String? remarks;
  String medicalRecord;
  String? user;
  String patient;
  String? hospitalRecord;
  List<TotalPaymentRequest>? totalPayment;
  List<ItemRequest>? item;

  MedicalQuotationRequest({
    this.fileName,
    this.quotationNumber,
    this.quotationDate,
    this.contact,
    this.registrationNumber,
    this.subject,
    this.totalAmount,
    this.validityPeriod,
    this.remarks,
    required this.medicalRecord,
    this.user,
    required this.patient,
    this.hospitalRecord,
    this.totalPayment,
    this.item,
  });

  factory MedicalQuotationRequest.fromJson(Map<String, dynamic> json) =>
      _$MedicalQuotationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalQuotationRequestToJson(this);
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
