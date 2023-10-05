// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordProgress _$MedicalRecordProgressFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordProgress(
      id: json['_id'] as String,
      task: json['task'] as String,
      completed: json['completed'] as bool,
      completionDate: json['completionDate'] == null
          ? null
          : DateTime.parse(json['completionDate'] as String),
      remarks: json['remarks'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordProgressToJson(
        MedicalRecordProgress instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'task': instance.task,
      'completed': instance.completed,
      'completionDate': instance.completionDate?.toIso8601String(),
      'remarks': instance.remarks,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
