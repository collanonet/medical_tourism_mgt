// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_oversea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordOversea _$MedicalRecordOverseaFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordOversea(
      id: json['_id'] as String,
      medicalRecord: json['medicalRecord'] as String,
      note: json['note'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordOverseaToJson(
        MedicalRecordOversea instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'medicalRecord': instance.medicalRecord,
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
