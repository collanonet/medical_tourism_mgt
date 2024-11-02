// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_patient_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrePatientRequest _$PrePatientRequestFromJson(Map<String, dynamic> json) =>
    PrePatientRequest(
      agents: json['agents'] as String?,
      patient: json['patient'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as bool?,
      nationality: json['nationality'] as String?,
      classification: json['classification'] as String?,
      nameOfDisease: json['nameOfDisease'] as String?,
      isDelete: (json['isDelete'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PrePatientRequestToJson(PrePatientRequest instance) =>
    <String, dynamic>{
      'agents': instance.agents,
      'patient': instance.patient,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'nationality': instance.nationality,
      'classification': instance.classification,
      'nameOfDisease': instance.nameOfDisease,
      'isDelete': instance.isDelete,
    };
