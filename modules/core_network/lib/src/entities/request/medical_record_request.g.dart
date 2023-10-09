// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordRequest _$MedicalRecordRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordRequest(
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      arrivalDate: json['arrivalDate'] == null
          ? null
          : DateTime.parse(json['arrivalDate'] as String),
      examinationDate: json['examinationDate'] == null
          ? null
          : DateTime.parse(json['examinationDate'] as String),
      departureDate: json['departureDate'] == null
          ? null
          : DateTime.parse(json['departureDate'] as String),
      caseNumber: json['caseNumber'] as String?,
      receptionDate: json['receptionDate'] == null
          ? null
          : DateTime.parse(json['receptionDate'] as String),
      type: json['type'] as String?,
      progress: json['progress'] as String?,
      advancePaymentDate: json['advancePaymentDate'] == null
          ? null
          : DateTime.parse(json['advancePaymentDate'] as String),
      paymentMethod: json['paymentMethod'] as String?,
      memo: json['memo'] as String?,
      patient: json['patient'] as String?,
    );

Map<String, dynamic> _$MedicalRecordRequestToJson(
        MedicalRecordRequest instance) =>
    <String, dynamic>{
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
      'arrivalDate': instance.arrivalDate?.toIso8601String(),
      'examinationDate': instance.examinationDate?.toIso8601String(),
      'departureDate': instance.departureDate?.toIso8601String(),
      'caseNumber': instance.caseNumber,
      'receptionDate': instance.receptionDate?.toIso8601String(),
      'type': instance.type,
      'progress': instance.progress,
      'advancePaymentDate': instance.advancePaymentDate?.toIso8601String(),
      'paymentMethod': instance.paymentMethod,
      'memo': instance.memo,
      'patient': instance.patient,
    };
