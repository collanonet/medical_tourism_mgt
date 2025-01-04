// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record_progress.g.dart';

@JsonSerializable()
class MedicalRecordProgress {
  @JsonKey(name: '_id')
  final String id;
  String key;
  String tag;
  String task;
  bool completed;
  DateTime? completionDate;
  String? remarks;
  String medicalRecord;
  String type;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordProgress({
    required this.id,
    required this.key,
    required this.tag,
    required this.task,
    required this.completed,
    this.completionDate,
    this.remarks,
    required this.medicalRecord,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordProgress.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordProgressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordProgressToJson(this);

  static FormGroup buildFormGroup(
      MedicalRecordProgress? medicalRecordProgress) {
    return FormGroup({
      '_id': FormControl<String>(value: medicalRecordProgress?.id),
      'task': FormControl<String>(value: medicalRecordProgress?.task),
      'completed': FormControl<bool>(value: medicalRecordProgress?.completed),
      'completionDate':
          FormControl<DateTime>(value: medicalRecordProgress?.completionDate),
      'remarks': FormControl<String>(value: medicalRecordProgress?.remarks),
      'medicalRecord':
          FormControl<String>(value: medicalRecordProgress?.medicalRecord),
      'createdAt':
          FormControl<DateTime>(value: medicalRecordProgress?.createdAt),
      'updatedAt':
          FormControl<DateTime>(value: medicalRecordProgress?.updatedAt),
    });
  }
}
