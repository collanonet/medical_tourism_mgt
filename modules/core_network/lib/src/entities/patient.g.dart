// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: json['_id'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      age: json['age'] as int?,
      gender: json['gender'] as bool?,
      familyName: json['familyName'] as String?,
      middleName: json['middleName'] as String?,
      firstName: json['firstName'] as String?,
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
      companyAGENTS: json['companyAGENTS'] as String?,
      nameInKanjiAGENTS: json['nameInKanjiAGENTS'] as String?,
      nameInKanaAGENTS: json['nameInKanaAGENTS'] as String?,
      progress: json['progress'] as String?,
      proposalNumber: json['proposalNumber'] as String?,
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      dateOfEntry: json['dateOfEntry'] == null
          ? null
          : DateTime.parse(json['dateOfEntry'] as String),
      medicalDay: json['medicalDay'] == null
          ? null
          : DateTime.parse(json['medicalDay'] as String),
      returnDate: json['returnDate'] == null
          ? null
          : DateTime.parse(json['returnDate'] as String),
      nationality: json['nationality'] as String?,
      diseaseName: json['diseaseName'] as String?,
      salesStaff: json['salesStaff'] as String?,
      businessStaff: json['businessStaff'] as String?,
      acceptingHospital: json['acceptingHospital'] as String?,
      groupSize: json['groupSize'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      '_id': instance.id,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
      'familyName': instance.familyName,
      'middleName': instance.middleName,
      'firstName': instance.firstName,
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
      'companyAGENTS': instance.companyAGENTS,
      'nameInKanjiAGENTS': instance.nameInKanjiAGENTS,
      'nameInKanaAGENTS': instance.nameInKanaAGENTS,
      'progress': instance.progress,
      'proposalNumber': instance.proposalNumber,
      'type': instance.type,
      'dateOfEntry': instance.dateOfEntry?.toIso8601String(),
      'medicalDay': instance.medicalDay?.toIso8601String(),
      'returnDate': instance.returnDate?.toIso8601String(),
      'nationality': instance.nationality,
      'diseaseName': instance.diseaseName,
      'salesStaff': instance.salesStaff,
      'businessStaff': instance.businessStaff,
      'acceptingHospital': instance.acceptingHospital,
      'groupSize': instance.groupSize,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
