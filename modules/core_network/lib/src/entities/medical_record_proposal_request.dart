import 'package:json_annotation/json_annotation.dart';

part 'medical_record_proposal_request.g.dart';

@JsonSerializable()
class MedicalRecordProposalRequest {
  String? hospitalName;
  String? postalCode;
  String? address;
  String? summary;
  String? medicalRecord;

  MedicalRecordProposalRequest({
    this.hospitalName,
    this.postalCode,
    this.address,
    this.summary,
    this.medicalRecord,
  });

  factory MedicalRecordProposalRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordProposalRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordProposalRequestToJson(this);
}