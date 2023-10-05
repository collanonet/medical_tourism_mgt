import 'package:json_annotation/json_annotation.dart';

part 'medical_record_interpreter.g.dart';

@JsonSerializable()
class MedicalRecordInterpreter {
  @JsonKey(name: '_id')
  final String id;
   bool requiredOrUnnecessary;
   String interpreter;
   String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordInterpreter({
    required this.id,
    required this.requiredOrUnnecessary,
    required this.interpreter,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordInterpreter.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordInterpreterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordInterpreterToJson(this);
}
