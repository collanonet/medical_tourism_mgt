// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_interpreter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordInterpreter _$MedicalRecordInterpreterFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordInterpreter(
      id: json['_id'] as String,
      requiredOrUnnnecessary: json['requiredOrUnnnecessary'] as bool?,
      interpreter: json['interpreter'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordInterpreterToJson(
        MedicalRecordInterpreter instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'requiredOrUnnnecessary': instance.requiredOrUnnnecessary,
      'interpreter': instance.interpreter,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
