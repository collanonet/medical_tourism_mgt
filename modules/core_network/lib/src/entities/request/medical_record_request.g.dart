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
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      gender: json['gender'] as bool?,
      arrivalDate: json['arrivalDate'] == null
          ? null
          : DateTime.parse(json['arrivalDate'] as String),
      consultationDate: json['consultationDate'] == null
          ? null
          : DateTime.parse(json['consultationDate'] as String),
      returnDate: json['returnDate'] == null
          ? null
          : DateTime.parse(json['returnDate'] as String),
      proposalNumber: json['proposalNumber'] as String?,
      receptionDate: json['receptionDate'] == null
          ? null
          : DateTime.parse(json['receptionDate'] as String),
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      progress: json['progress'] as String?,
      advancePaymentDate: json['advancePaymentDate'] == null
          ? null
          : DateTime.parse(json['advancePaymentDate'] as String),
      receivingMethod: json['receivingMethod'] as String?,
      memo: json['memo'] as String?,
      patient: json['patient'] as String,
    );

Map<String, dynamic> _$MedicalRecordRequestToJson(
        MedicalRecordRequest instance) =>
    <String, dynamic>{
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'gender': instance.gender,
      'arrivalDate': instance.arrivalDate?.toIso8601String(),
      'consultationDate': instance.consultationDate?.toIso8601String(),
      'returnDate': instance.returnDate?.toIso8601String(),
      'proposalNumber': instance.proposalNumber,
      'receptionDate': instance.receptionDate?.toIso8601String(),
      'type': instance.type,
      'progress': instance.progress,
      'advancePaymentDate': instance.advancePaymentDate?.toIso8601String(),
      'receivingMethod': instance.receivingMethod,
      'memo': instance.memo,
      'patient': instance.patient,
    };
