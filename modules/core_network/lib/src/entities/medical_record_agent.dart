import 'package:json_annotation/json_annotation.dart';

part 'medical_record_agent.g.dart';

@JsonSerializable()
class MedicalRecordAgent {
  @JsonKey(name: '_id')
  final String id;
   String company;
   String nameInKanji;
   String nameInKana;
   String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordAgent({
    required this.id,
    required this.company,
    required this.nameInKanji,
    required this.nameInKana,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordAgent.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordAgentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordAgentToJson(this);
}
