// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_companion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordCompanionRequest _$MedicalRecordCompanionRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordCompanionRequest(
      leader: json['leader'] as bool?,
      remarks: json['remarks'] as String?,
      familyNameRomanized: json['familyNameRomanized'] as String?,
      middleNameRomanized: json['middleNameRomanized'] as String?,
      firstNameRomanized: json['firstNameRomanized'] as String?,
      familyNameChineseOrVietnamese:
          json['familyNameChineseOrVietnamese'] as String?,
      middleNameChineseOrVietnamese:
          json['middleNameChineseOrVietnamese'] as String?,
      firstNameChineseOrVietnamese:
          json['firstNameChineseOrVietnamese'] as String?,
      familyNameJapaneseForChinese:
          json['familyNameJapaneseForChinese'] as String?,
      middleNameJapaneseForChinese:
          json['middleNameJapaneseForChinese'] as String?,
      firstNameJapaneseForChinese:
          json['firstNameJapaneseForChinese'] as String?,
      familyNameJapaneseForNonChinese:
          json['familyNameJapaneseForNonChinese'] as String?,
      middleNameJapaneseForNonChinese:
          json['middleNameJapaneseForNonChinese'] as String?,
      firstNameJapaneseForNonChinese:
          json['firstNameJapaneseForNonChinese'] as String?,
      nationality: json['nationality'] as String?,
      relationship: json['relationship'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      age: json['age'] as int?,
      gender: json['gender'] as bool?,
      mobileNumber: json['mobileNumber'] as String?,
      email: json['email'] as String?,
      chatToolLink: (json['chatToolLink'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      passportNumber: json['passportNumber'] as String?,
      issueDate: json['issueDate'] == null
          ? null
          : DateTime.parse(json['issueDate'] as String),
      expirationDate: json['expirationDate'] == null
          ? null
          : DateTime.parse(json['expirationDate'] as String),
      visaType: json['visaType'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
      chatQrImage: json['chatQrImage'] as String?,
    );

Map<String, dynamic> _$MedicalRecordCompanionRequestToJson(
        MedicalRecordCompanionRequest instance) =>
    <String, dynamic>{
      'leader': instance.leader,
      'remarks': instance.remarks,
      'familyNameRomanized': instance.familyNameRomanized,
      'middleNameRomanized': instance.middleNameRomanized,
      'firstNameRomanized': instance.firstNameRomanized,
      'familyNameChineseOrVietnamese': instance.familyNameChineseOrVietnamese,
      'middleNameChineseOrVietnamese': instance.middleNameChineseOrVietnamese,
      'firstNameChineseOrVietnamese': instance.firstNameChineseOrVietnamese,
      'familyNameJapaneseForChinese': instance.familyNameJapaneseForChinese,
      'middleNameJapaneseForChinese': instance.middleNameJapaneseForChinese,
      'firstNameJapaneseForChinese': instance.firstNameJapaneseForChinese,
      'familyNameJapaneseForNonChinese':
          instance.familyNameJapaneseForNonChinese,
      'middleNameJapaneseForNonChinese':
          instance.middleNameJapaneseForNonChinese,
      'firstNameJapaneseForNonChinese': instance.firstNameJapaneseForNonChinese,
      'nationality': instance.nationality,
      'relationship': instance.relationship,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'chatToolLink': instance.chatToolLink,
      'passportNumber': instance.passportNumber,
      'issueDate': instance.issueDate?.toIso8601String(),
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'visaType': instance.visaType,
      'chatQrImage': instance.chatQrImage,
      'medicalRecord': instance.medicalRecord,
    };
