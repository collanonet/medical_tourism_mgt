// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_agent_request.g.dart';

@JsonSerializable()
class MedicalRecordAgentRequest {
  String? company;
  String? nameInKanji;
  String? nameInKana;
  String medicalRecord;

  MedicalRecordAgentRequest({
    this.company,
    this.nameInKanji,
    this.nameInKana,
    required this.medicalRecord,
  });

  factory MedicalRecordAgentRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordAgentRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordAgentRequestToJson(this);
}
