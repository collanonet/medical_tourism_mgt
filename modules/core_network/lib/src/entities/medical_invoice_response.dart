import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';
import '../../entities.dart';
import 'entities.dart';

part 'medical_invoice_response.g.dart';

@JsonSerializable()
class MedicalInvoiceResponse {
  @JsonKey(name: '_id')
  String id;
  String file;
  String? invoiceNumber;
  DateTime? invoiceDate;
  String? registrationNumber;
  String? subject;
  String? amountBilled;
  DateTime? paymentDeadline;
  String? bankTransferInformation;
  String? remarks;
  MedicalRecord medicalRecord;
  Patient user;
  BasicInformationHospitalResponse? hospitalRecord;
  List<TotalPaymentResponse>? totalPayment;
  List<ItemResponse>? item;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalInvoiceResponse({
    required this.id,
    required this.file,
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalInvoiceResponseToJson(this);
}

@JsonSerializable()
class TotalPaymentResponse {
  @JsonKey(name: '_id')
  String id;
  String taxRate;
  String amountExcludingTaxInYen;
  String consumptionTaxAmountInYen;

  TotalPaymentResponse({
    required this.id,
    required this.taxRate,
    required this.amountExcludingTaxInYen,
    required this.consumptionTaxAmountInYen,
  });

  factory TotalPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$TotalPaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TotalPaymentResponseToJson(this);
}

@JsonSerializable()
class ItemResponse {
  @JsonKey(name: '_id')
  String id;
  DateTime transactionDate;
  String details;
  String quantity;
  String unit;
  String unitPrice;
  String amount;
  String taxRate;

  ItemResponse({
    required this.id,
    required this.transactionDate,
    required this.details,
    required this.quantity,
    required this.unit,
    required this.unitPrice,
    required this.amount,
    required this.taxRate,
  });

  factory ItemResponse.fromJson(Map<String, dynamic> json) => _$ItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemResponseToJson(this);
}
