import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';

part 'medical_quotation_response.g.dart';

@JsonSerializable()
class MedicalQuotationResponse {
  @JsonKey(name: '_id')
  String id;
  String? quotationNumber;
  DateTime? quotationDate;
  String? registrationNumber;
  String? subject;
  String? totalAmount;
  DateTime? validityPeriod;
  String? remarks;
  MedicalRecord medicalRecord;
  Patient user;
  BasicInformationHospitalResponse? hospitalRecord;
  List<TotalPaymentResponse>? totalPayment;
  List<ItemResponse>? item;
  DateTime createdAt;
  DateTime updatedAt;

  MedicalQuotationResponse({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalQuotationResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalQuotationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalQuotationResponseToJson(this);
}