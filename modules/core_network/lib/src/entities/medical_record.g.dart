// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecord _$MedicalRecordFromJson(Map<String, dynamic> json) =>
    MedicalRecord(
      id: json['_id'] as String,
      arrivalDate: DateTime.parse(json['arrivalDate'] as String),
      examinationDate: DateTime.parse(json['examinationDate'] as String),
      departureDate: DateTime.parse(json['departureDate'] as String),
      caseNumber: json['caseNumber'] as String,
      receptionDate: DateTime.parse(json['receptionDate'] as String),
      type: json['type'] as String,
      progress: json['progress'] as String,
      advancePaymentDate: DateTime.parse(json['advancePaymentDate'] as String),
      paymentMethod: json['paymentMethod'] as String,
      memo: json['memo'] as String?,
      patient: json['patient'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordToJson(MedicalRecord instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'arrivalDate': instance.arrivalDate.toIso8601String(),
      'examinationDate': instance.examinationDate.toIso8601String(),
      'departureDate': instance.departureDate.toIso8601String(),
      'caseNumber': instance.caseNumber,
      'receptionDate': instance.receptionDate.toIso8601String(),
      'type': instance.type,
      'progress': instance.progress,
      'advancePaymentDate': instance.advancePaymentDate.toIso8601String(),
      'paymentMethod': instance.paymentMethod,
      'memo': instance.memo,
      'patient': instance.patient,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
