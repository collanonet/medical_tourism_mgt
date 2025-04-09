// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecord _$MedicalRecordFromJson(Map<String, dynamic> json) =>
    MedicalRecord(
      id: json['_id'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      age: (json['age'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
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
      visaFile: json['visaFile'] as String?,
      patient: json['patient'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordToJson(MedicalRecord instance) =>
    <String, dynamic>{
      '_id': instance.id,
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
      'visaFile': instance.visaFile,
      'memo': instance.memo,
      'patient': instance.patient,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
