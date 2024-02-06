// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientRequest _$PatientRequestFromJson(Map<String, dynamic> json) =>
    PatientRequest(
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      age: json['age'] as int?,
      gender: json['gender'] as bool?,
      familyName: json['familyName'] as String?,
      middleName: json['middleName'] as String?,
      firstName: json['firstName'] as String?,
      prePatient: json['prePatient'] as String?,
    );

Map<String, dynamic> _$PatientRequestToJson(PatientRequest instance) =>
    <String, dynamic>{
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
      'familyName': instance.familyName,
      'middleName': instance.middleName,
      'firstName': instance.firstName,
      'prePatient': instance.prePatient,
    };
