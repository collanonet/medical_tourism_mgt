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
      gender: json['gender'] as String?,
      nationality: json['nationality'] as String?,
      classification: json['classification'] as String?,
      nameOfDisease: json['nameOfDisease'] as String?,
      isDeleted: json['isDeleted'] as bool,
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
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
