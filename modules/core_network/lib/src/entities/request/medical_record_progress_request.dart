import 'package:json_annotation/json_annotation.dart';

part 'medical_record_progress_request.g.dart';

@JsonSerializable()
class MedicalRecordProgressRequest {
   String? task;
   bool? completed;
   DateTime? completionDate;
   String? remarks;
   String? medicalRecord;

  MedicalRecordProgressRequest({
     this.task,
     this.completed,
    this.completionDate,
    this.remarks,
     this.medicalRecord,
  });

  factory MedicalRecordProgressRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordProgressRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordProgressRequestToJson(this);
}
