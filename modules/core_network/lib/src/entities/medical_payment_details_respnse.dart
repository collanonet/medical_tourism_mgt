// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_payment_details_respnse.g.dart';
@JsonSerializable()
class MedicalPaymentResponse {
   @JsonKey(name: '_id')
  String id;
   String? file;
  String? theNameOfTheHospital;
  String? documentName;
  DateTime? dateOfIssue;
  String? medicalRecord;

  MedicalPaymentResponse({
    required this.id,
    this.file,
    this.theNameOfTheHospital,
    this.documentName,
    this.dateOfIssue,
    this.medicalRecord,
  });
  factory MedicalPaymentResponse.fromJson(Map<String, dynamic> json) => _$MedicalPaymentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalPaymentResponseToJson(this);
}
