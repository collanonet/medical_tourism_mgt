// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_companion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordCompanion _$MedicalRecordCompanionFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordCompanion(
      id: json['_id'] as String,
      remarks: json['remarks'] as String?,
      leader: json['leader'] as bool?,
      nameInRomanized: json['nameInRomanized'] as String?,
      nameInChineseOrKanji: json['nameInChineseOrKanji'] as String?,
      nameInJapaneseKanji: json['nameInJapaneseKanji'] as String?,
      nameInKana: json['nameInKana'] as String?,
      nationality: json['nationality'] as String?,
      relationship: json['relationship'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      age: json['age'] as int?,
      gender: json['gender'] as bool?,
      passportNumber: json['passportNumber'] as String?,
      issueDate: json['issueDate'] == null
          ? null
          : DateTime.parse(json['issueDate'] as String),
      expirationDate: json['expirationDate'] == null
          ? null
          : DateTime.parse(json['expirationDate'] as String),
      visaType: json['visaType'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordCompanionToJson(
        MedicalRecordCompanion instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'remarks': instance.remarks,
      'leader': instance.leader,
      'nameInRomanized': instance.nameInRomanized,
      'nameInChineseOrKanji': instance.nameInChineseOrKanji,
      'nameInJapaneseKanji': instance.nameInJapaneseKanji,
      'nameInKana': instance.nameInKana,
      'nationality': instance.nationality,
      'relationship': instance.relationship,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
      'passportNumber': instance.passportNumber,
      'issueDate': instance.issueDate?.toIso8601String(),
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'visaType': instance.visaType,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
