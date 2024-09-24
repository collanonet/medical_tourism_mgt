import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';
import '../../entities.dart';
import 'entities.dart';

part 'medical_invoice_response.g.dart';

@JsonSerializable()
class MedicalInvoiceResponse {
  @JsonKey(name: '_id')
  String id;
  String? fileName;
  String? invoiceNumber;
  DateTime? invoiceDate;
  String? registrationNumber;
  String? subject;
  double? amountBilled;
  DateTime? paymentDeadline;
  String? bankTransferInformation;
  String? remarks;
  MedicalRecord medicalRecord;
  Patient? user;
  BasicInformationHospitalResponse? hospitalRecord;
  List<TotalPaymentResponse>? totalPayment;
  List<ItemResponse>? item;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalInvoiceResponse({
    required this.id,
    this.fileName,
    this.invoiceNumber,
    this.invoiceDate,
    this.registrationNumber,
    this.subject,
    this.amountBilled,
    this.paymentDeadline,
    this.bankTransferInformation,
    this.remarks,
    required this.medicalRecord,
    this.user,
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
  double? taxRate;
  double? amountExcludingTaxInYen;
  double? consumptionTaxAmountInYen;

  TotalPaymentResponse({
    required this.id,
    this.taxRate,
    this.amountExcludingTaxInYen,
    this.consumptionTaxAmountInYen,
  });

  factory TotalPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$TotalPaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TotalPaymentResponseToJson(this);
}

@JsonSerializable()
class ItemResponse {
  @JsonKey(name: '_id')
  String id;
  DateTime? transactionDate;
  String? details;
  double? quantity;
  String? unit;
  double? unitPrice;
  double? amount;
  double? taxRate;

  ItemResponse({
    required this.id,
    this.transactionDate,
    this.details,
    this.quantity,
    this.unit,
    this.unitPrice,
    this.amount,
    this.taxRate,
  });

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemResponseToJson(this);
}
