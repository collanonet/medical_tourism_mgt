// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordRequest _$MedicalRecordRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordRequest(
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
