// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_companion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordCompanionRequest _$MedicalRecordCompanionRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordCompanionRequest(
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
      gender: json['gender'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$MedicalRecordCompanionRequestToJson(
        MedicalRecordCompanionRequest instance) =>
    <String, dynamic>{
      'nameInRomanized': instance.nameInRomanized,
      'nameInChineseOrKanji': instance.nameInChineseOrKanji,
      'nameInJapaneseKanji': instance.nameInJapaneseKanji,
      'nameInKana': instance.nameInKana,
      'nationality': instance.nationality,
      'relationship': instance.relationship,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
      'medicalRecord': instance.medicalRecord,
    };
