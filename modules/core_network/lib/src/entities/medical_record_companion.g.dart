// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_companion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordCompanion _$MedicalRecordCompanionFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordCompanion(
      id: json['_id'] as String,
      nameInRomanized: json['nameInRomanized'] as String,
      nameInChineseOrKanji: json['nameInChineseOrKanji'] as String,
      nameInJapaneseKanji: json['nameInJapaneseKanji'] as String,
      nameInKana: json['nameInKana'] as String,
      nationality: json['nationality'] as String,
      relationship: json['relationship'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      age: json['age'] as int,
      gender: json['gender'] as String,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordCompanionToJson(
        MedicalRecordCompanion instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nameInRomanized': instance.nameInRomanized,
      'nameInChineseOrKanji': instance.nameInChineseOrKanji,
      'nameInJapaneseKanji': instance.nameInJapaneseKanji,
      'nameInKana': instance.nameInKana,
      'nationality': instance.nationality,
      'relationship': instance.relationship,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
