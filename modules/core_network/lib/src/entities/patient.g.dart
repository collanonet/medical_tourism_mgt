// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: json['_id'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      age: json['age'] as int?,
      gender: json['gender'] as bool?,
      familyName: json['familyName'] as String?,
      middleName: json['middleName'] as String?,
      firstName: json['firstName'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      '_id': instance.id,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
      'familyName': instance.familyName,
      'middleName': instance.middleName,
      'firstName': instance.firstName,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
