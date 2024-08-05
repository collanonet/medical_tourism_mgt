import 'package:json_annotation/json_annotation.dart';
part 'medical_payment_details_request.g.dart';
@JsonSerializable()
class MedicalPaymentRequest {
  String? uploadFile;
  String? nameOfHospital;
  String? documentName;
  DateTime? dataOfIssue;

  MedicalPaymentRequest({
    this.uploadFile,
    this.nameOfHospital,
    this.documentName,
    this.dataOfIssue,
  });
  factory MedicalPaymentRequest.fromJson(Map<String, dynamic> json) => _$MedicalPaymentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalPaymentRequestToJson(this);
}