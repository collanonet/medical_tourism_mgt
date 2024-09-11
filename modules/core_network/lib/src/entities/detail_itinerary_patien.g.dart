// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_patien.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientItinerary _$PatientItineraryFromJson(Map<String, dynamic> json) =>
    PatientItinerary(
      id: json['_id'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as bool?,
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isClosed: json['isClosed'] as bool?,
      prePatient: json['prePatient'] as String?,
      user: json['user'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt(),
      familyNameChineseOrVietnamese:
          json['familyNameChineseOrVietnamese'] as String?,
      familyNameJapaneseForChinese:
          json['familyNameJapaneseForChinese'] as String?,
      familyNameJapaneseForNonChinese:
          json['familyNameJapaneseForNonChinese'] as String?,
      familyNameRomanized: json['familyNameRomanized'] as String?,
      firstNameChineseOrVietnamese:
          json['firstNameChineseOrVietnamese'] as String?,
      firstNameJapaneseForChinese:
          json['firstNameJapaneseForChinese'] as String?,
      firstNameJapaneseForNonChinese:
          json['firstNameJapaneseForNonChinese'] as String?,
      firstNameRomanized: json['firstNameRomanized'] as String?,
      middleNameChineseOrVietnamese:
          json['middleNameChineseOrVietnamese'] as String?,
      middleNameJapaneseForChinese:
          json['middleNameJapaneseForChinese'] as String?,
      middleNameJapaneseForNonChinese:
          json['middleNameJapaneseForNonChinese'] as String?,
      middleNameRomanized: json['middleNameRomanized'] as String?,
      nationality: json['nationality'] as String?,
      dateOfEntry: json['dateOfEntry'] == null
          ? null
          : DateTime.parse(json['dateOfEntry'] as String),
      medicalDay: json['medicalDay'] == null
          ? null
          : DateTime.parse(json['medicalDay'] as String),
      progress: json['progress'] as String?,
      proposalNumber: json['proposalNumber'] as String?,
      returnDate: json['returnDate'] == null
          ? null
          : DateTime.parse(json['returnDate'] as String),
      companyAGENTS: json['companyAGENTS'] as String?,
      nameInKanaAGENTS: json['nameInKanaAGENTS'] as String?,
      nameInKanjiAGENTS: json['nameInKanjiAGENTS'] as String?,
    );

Map<String, dynamic> _$PatientItineraryToJson(PatientItinerary instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
      'type': instance.type,
      'isClosed': instance.isClosed,
      'prePatient': instance.prePatient,
      'user': instance.user,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'version': instance.version,
      'familyNameChineseOrVietnamese': instance.familyNameChineseOrVietnamese,
      'familyNameJapaneseForChinese': instance.familyNameJapaneseForChinese,
      'familyNameJapaneseForNonChinese':
          instance.familyNameJapaneseForNonChinese,
      'familyNameRomanized': instance.familyNameRomanized,
      'firstNameChineseOrVietnamese': instance.firstNameChineseOrVietnamese,
      'firstNameJapaneseForChinese': instance.firstNameJapaneseForChinese,
      'firstNameJapaneseForNonChinese': instance.firstNameJapaneseForNonChinese,
      'firstNameRomanized': instance.firstNameRomanized,
      'middleNameChineseOrVietnamese': instance.middleNameChineseOrVietnamese,
      'middleNameJapaneseForChinese': instance.middleNameJapaneseForChinese,
      'middleNameJapaneseForNonChinese':
          instance.middleNameJapaneseForNonChinese,
      'middleNameRomanized': instance.middleNameRomanized,
      'nationality': instance.nationality,
      'dateOfEntry': instance.dateOfEntry?.toIso8601String(),
      'medicalDay': instance.medicalDay?.toIso8601String(),
      'progress': instance.progress,
      'proposalNumber': instance.proposalNumber,
      'returnDate': instance.returnDate?.toIso8601String(),
      'companyAGENTS': instance.companyAGENTS,
      'nameInKanaAGENTS': instance.nameInKanaAGENTS,
      'nameInKanjiAGENTS': instance.nameInKanjiAGENTS,
    };
