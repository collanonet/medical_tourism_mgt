// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordAgent _$MedicalRecordAgentFromJson(Map<String, dynamic> json) =>
    MedicalRecordAgent(
      id: json['_id'] as String,
      company: json['company'] as String,
      nameInKanji: json['nameInKanji'] as String?,
      nameInKana: json['nameInKana'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordAgentToJson(MedicalRecordAgent instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'company': instance.company,
      'nameInKanji': instance.nameInKanji,
      'nameInKana': instance.nameInKana,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
