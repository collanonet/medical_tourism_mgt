// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_payment_details_respnse.g.dart';
@JsonSerializable()
class MedicalPaymentResponse {
   @JsonKey(name: '_id')
  String id;
  String? uploadFile;
  String? nameOfHospital;
  String? documentName;
  DateTime? dataOfIssue;

  MedicalPaymentResponse({
    required this.id,
    this.uploadFile,
    this.nameOfHospital,
    this.documentName,
    this.dataOfIssue,
  });
  factory MedicalPaymentResponse.fromJson(Map<String, dynamic> json) => _$MedicalPaymentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalPaymentResponseToJson(this);
}
