// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientName _$PatientNameFromJson(Map<String, dynamic> json) => PatientName(
      id: json['_id'] as String,
      familyName: json['familyName'] as String,
      middleName: json['middleName'] as String,
      firstName: json['firstName'] as String,
      nameType: json['nameType'] as String,
      patient: json['patient'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PatientNameToJson(PatientName instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'familyName': instance.familyName,
      'middleName': instance.middleName,
      'firstName': instance.firstName,
      'nameType': instance.nameType,
      'patient': instance.patient,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
