// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_personal_request.g.dart';
@JsonSerializable()
class MedicalVisaPersonalRequest {
  String? medicalVisa;
  DateTime? applicationDate;
  DateTime? issueDate;
  DateTime? expirationDate;
  String? accompanyingPersonsNumber;
  String? visaIssuingOverseasEstablishments;
  String? remarks;
  String? paymentStatus;

  MedicalVisaPersonalRequest({
    this.medicalVisa,
    this.applicationDate,
    this.issueDate,
    this.expirationDate,
    this.accompanyingPersonsNumber,
    this.visaIssuingOverseasEstablishments,
    this.remarks,
    this.paymentStatus,
  });

  factory MedicalVisaPersonalRequest.fromJson(Map<String, dynamic> json) => _$MedicalVisaPersonalRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalVisaPersonalRequestToJson(this);
}
