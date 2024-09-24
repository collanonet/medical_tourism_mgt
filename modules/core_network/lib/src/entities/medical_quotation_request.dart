import 'package:json_annotation/json_annotation.dart';

part 'medical_quotation_request.g.dart';

@JsonSerializable()
class MedicalQuotationRequest {
  String file;
  String? quotationNumber;
  DateTime? quotationDate;
  String? registrationNumber;
  String? subject;
  String? totalAmount;
  DateTime? validityPeriod;
  String? remarks;
  String medicalRecord;
  String user;
  String? hospitalRecord;
  List<TotalPaymentRequest>? totalPayment;
  List<ItemRequest>? item;

  MedicalQuotationRequest({
    required this.file,
    this.quotationNumber,
    this.quotationDate,
    this.registrationNumber,
    this.subject,
    this.totalAmount,
    this.validityPeriod,
    this.remarks,
    required this.medicalRecord,
    required this.user,
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
  String taxRate;
  String amountExcludingTaxInYen;
  String consumptionTaxAmountInYen;

  TotalPaymentRequest({
    required this.taxRate,
    required this.amountExcludingTaxInYen,
    required this.consumptionTaxAmountInYen,
  });

  factory TotalPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$TotalPaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TotalPaymentRequestToJson(this);
}

@JsonSerializable()
class ItemRequest {
  DateTime transactionDate;
  String? details;
  String quantity;
  String unit;
  String unitPrice;
  String amount;
  String taxRate;

  ItemRequest({
    required this.transactionDate,
    this.details,
    required this.quantity,
    required this.unit,
    required this.unitPrice,
    required this.amount,
    required this.taxRate,
  });

  factory ItemRequest.fromJson(Map<String, dynamic> json) => _$ItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ItemRequestToJson(this);
}
