// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

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

  static FormGroup buildFormGroup(MedicalRecordAgent? medicalRecordAgent) {
    return FormGroup({
      '_id': FormControl<String>(value: medicalRecordAgent?.id),
      'company': FormControl<String>(value: medicalRecordAgent?.company),
      'nameInKanji':
          FormControl<String>(value: medicalRecordAgent?.nameInKanji),
      'nameInKana': FormControl<String>(value: medicalRecordAgent?.nameInKana),
      'medicalRecord':
          FormControl<String>(value: medicalRecordAgent?.medicalRecord),
      'createdAt': FormControl<DateTime>(value: medicalRecordAgent?.createdAt),
      'updatedAt': FormControl<DateTime>(value: medicalRecordAgent?.updatedAt),
    });
  }
}
