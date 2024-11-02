// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrePatient _$PrePatientFromJson(Map<String, dynamic> json) => PrePatient(
      id: json['_id'] as String,
      agents: json['agents'] as String?,
      patient: json['patient'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as bool,
      nationality: json['nationality'] as String?,
      classification: json['classification'] as String?,
      nameOfDisease: json['nameOfDisease'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      isDelete: (json['isDelete'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PrePatientToJson(PrePatient instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'agents': instance.agents,
      'patient': instance.patient,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'nationality': instance.nationality,
      'classification': instance.classification,
      'nameOfDisease': instance.nameOfDisease,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'isDelete': instance.isDelete,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
