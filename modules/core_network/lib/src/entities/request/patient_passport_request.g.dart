// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_passport_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientPassportRequest _$PatientPassportRequestFromJson(
        Map<String, dynamic> json) =>
    PatientPassportRequest(
      passportNumber: json['passportNumber'] as String?,
      issueDate: json['issueDate'] == null
          ? null
          : DateTime.parse(json['issueDate'] as String),
      expirationDate: json['expirationDate'] == null
          ? null
          : DateTime.parse(json['expirationDate'] as String),
      visaType: json['visaType'] as String?,
      visaCategory: json['visaCategory'] as String?,
      underConfirmation: json['underConfirmation'] as bool?,
      patient: json['patient'] as String?,
    );

Map<String, dynamic> _$PatientPassportRequestToJson(
        PatientPassportRequest instance) =>
    <String, dynamic>{
      'passportNumber': instance.passportNumber,
      'issueDate': instance.issueDate?.toIso8601String(),
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'visaType': instance.visaType,
      'visaCategory': instance.visaCategory,
      'underConfirmation': instance.underConfirmation,
      'patient': instance.patient,
    };
