// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_passport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientPassport _$PatientPassportFromJson(Map<String, dynamic> json) =>
    PatientPassport(
      id: json['_id'] as String,
      passportNumber: json['passportNumber'] as String?,
      issueDate: json['issueDate'] == null
          ? null
          : DateTime.parse(json['issueDate'] as String),
      expirationDate: json['expirationDate'] == null
          ? null
          : DateTime.parse(json['expirationDate'] as String),
      visaType: json['visaType'] as String,
      visaCategory: json['visaCategory'] as String?,
      underConfirmation: json['underConfirmation'] as bool?,
      patient: json['patient'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PatientPassportToJson(PatientPassport instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'passportNumber': instance.passportNumber,
      'issueDate': instance.issueDate?.toIso8601String(),
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'visaType': instance.visaType,
      'visaCategory': instance.visaCategory,
      'underConfirmation': instance.underConfirmation,
      'patient': instance.patient,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
