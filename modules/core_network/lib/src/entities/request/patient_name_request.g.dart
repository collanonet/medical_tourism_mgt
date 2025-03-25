// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_name_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientNameRequest _$PatientNameRequestFromJson(Map<String, dynamic> json) =>
    PatientNameRequest(
      familyNameRomanized: json['familyNameRomanized'] as String,
      middleNameRomanized: json['middleNameRomanized'] as String?,
      firstNameRomanized: json['firstNameRomanized'] as String,
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
      patient: json['patient'] as String?,
    );

Map<String, dynamic> _$PatientNameRequestToJson(PatientNameRequest instance) =>
    <String, dynamic>{
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
      'patient': instance.patient,
    };
