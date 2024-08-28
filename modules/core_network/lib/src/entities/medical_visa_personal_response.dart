// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_personal_response.g.dart';

@JsonSerializable()
class MedicalVisaPersonalResponse {
  @JsonKey(name: '_id')
  final String id;
  String? medicalVisa;
  DateTime? applicationDate;
  DateTime? issueDate;
  DateTime? expirationDate;
  String? accompanyingPersonsNumber;
  String? visaIssuingOverseasEstablishments;
  String? remarks;
  String? paymentStatus;

  MedicalVisaPersonalResponse({
    required this.id,
    this.medicalVisa,
    this.issueDate,
    this.expirationDate,
    this.accompanyingPersonsNumber,
    this.visaIssuingOverseasEstablishments,
    this.remarks,
    this.paymentStatus,
  });

  factory MedicalVisaPersonalResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalVisaPersonalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalVisaPersonalResponseToJson(this);
}
