// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_progress_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordProgressRequest _$MedicalRecordProgressRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordProgressRequest(
      task: json['task'] as String?,
      completed: json['completed'] as bool?,
      completionDate: json['completionDate'] == null
          ? null
          : DateTime.parse(json['completionDate'] as String),
      remarks: json['remarks'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$MedicalRecordProgressRequestToJson(
        MedicalRecordProgressRequest instance) =>
    <String, dynamic>{
      'task': instance.task,
      'completed': instance.completed,
      'completionDate': instance.completionDate?.toIso8601String(),
      'remarks': instance.remarks,
      'medicalRecord': instance.medicalRecord,
    };
