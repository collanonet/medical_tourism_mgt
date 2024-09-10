// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_payment_details_request.g.dart';
@JsonSerializable()
class MedicalPaymentRequest {
  String? file;
  String? theNameOfTheHospital;
  String? documentName;
  DateTime? dateOfIssue;
  String? medicalRecord;

  MedicalPaymentRequest({
    this.file,
    this.theNameOfTheHospital,
    this.documentName,
    this.dateOfIssue,
    this.medicalRecord,
  });
  factory MedicalPaymentRequest.fromJson(Map<String, dynamic> json) => _$MedicalPaymentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalPaymentRequestToJson(this);
}
