import 'package:json_annotation/json_annotation.dart';

part 'medical_record_progress.g.dart';

@JsonSerializable()
class MedicalRecordProgress {
  @JsonKey(name: '_id')
  final String id;
   String task;
   bool completed;
   DateTime? completionDate;
   String? remarks;
   String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordProgress({
    required this.id,
    required this.task,
    required this.completed,
    this.completionDate,
    this.remarks,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordProgress.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordProgressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordProgressToJson(this);
}
