// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_progress_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordProgressRequest _$MedicalRecordProgressRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordProgressRequest(
      id: json['id'] as String?,
      key: json['key'] as String,
      tag: json['tag'] as String,
      task: json['task'] as String,
      completed: json['completed'] as bool,
      completionDate: json['completionDate'] == null
          ? null
          : DateTime.parse(json['completionDate'] as String),
      remarks: json['remarks'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$MedicalRecordProgressRequestToJson(
        MedicalRecordProgressRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'tag': instance.tag,
      'task': instance.task,
      'completed': instance.completed,
      'completionDate': instance.completionDate?.toIso8601String(),
      'remarks': instance.remarks,
      'medicalRecord': instance.medicalRecord,
      'type': instance.type,
    };
