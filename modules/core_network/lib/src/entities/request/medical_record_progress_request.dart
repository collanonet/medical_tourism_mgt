import 'package:json_annotation/json_annotation.dart';

part 'medical_record_progress_request.g.dart';

@JsonSerializable()
class MedicalRecordProgressRequest {
  String key;
  String tag;
  String task;
  bool completed;
  DateTime? completionDate;
  String? remarks;
  String medicalRecord;
  String type;

  MedicalRecordProgressRequest({
    required this.key,
    required this.tag,
    required this.task,
    required this.completed,
    required this.completionDate,
    this.remarks,
    required this.medicalRecord,
    required this.type,
  });

  factory MedicalRecordProgressRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordProgressRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordProgressRequestToJson(this);
}
