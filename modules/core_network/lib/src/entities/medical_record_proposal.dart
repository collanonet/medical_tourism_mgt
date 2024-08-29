// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_proposal.g.dart';

@JsonSerializable()
class MedicalRecordProposal {
  @JsonKey(name: '_id')
  String id;
  String? hospitalName;
  String? postalCode;
  String? address;
  String? summary;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordProposal({
    required this.id,
    this.hospitalName,
    this.postalCode,
    this.address,
    this.summary,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordProposal.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordProposalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordProposalToJson(this);
}
