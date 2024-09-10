// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordSummary _$MedicalRecordSummaryFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordSummary(
      id: json['_id'] as String,
      entryDate: json['entryDate'] == null
          ? null
          : DateTime.parse(json['entryDate'] as String),
      namePassport: json['namePassport'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as bool?,
      nameChineseKanjiVietnamese: json['nameChineseKanjiVietnamese'] as String?,
      nameKana: json['nameKana'] as String?,
      currentAddress: json['currentAddress'] as String?,
      mobileNumberPatient: json['mobileNumberPatient'] as String?,
      mobileNumberDomestic: json['mobileNumberDomestic'] as String?,
      diseaseName: json['diseaseName'] as String?,
      tissueType: json['tissueType'] as String?,
      diseaseNotices: json['diseaseNotices'] as bool?,
      diagnosticMedicalInstitutionName:
          json['diagnosticMedicalInstitutionName'] as String?,
      pastIllnessFamilyHistory: json['pastIllnessFamilyHistory'] as String?,
      referralMedicalInstitutionEtc:
          json['referralMedicalInstitutionEtc'] as String?,
      diseaseCourseSndTestResultsEtc:
          json['diseaseCourseSndTestResultsEtc'] as String?,
      symptoms: json['symptoms'] as String?,
      notices: json['notices'] as bool?,
      metastasis: json['metastasis'] as bool?,
      radiationTreatmentOrNot: json['radiationTreatmentOrNot'] as bool?,
      presenceOfAnticancerDrugTreatment:
          json['presenceOfAnticancerDrugTreatment'] as bool?,
      biopsy: json['biopsy'] as bool?,
      patientsWishes: json['patientsWishes'] as String?,
      agentName: json['agentName'] as String?,
      personInChargeName: json['personInChargeName'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      patientsAddressStay: json['patientsAddressStay'] as String?,
      emergencyContact: json['emergencyContact'] as String?,
      remarks: json['remarks'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordSummaryToJson(
        MedicalRecordSummary instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'entryDate': instance.entryDate?.toIso8601String(),
      'namePassport': instance.namePassport,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
      'nameChineseKanjiVietnamese': instance.nameChineseKanjiVietnamese,
      'nameKana': instance.nameKana,
      'currentAddress': instance.currentAddress,
      'mobileNumberPatient': instance.mobileNumberPatient,
      'mobileNumberDomestic': instance.mobileNumberDomestic,
      'diseaseName': instance.diseaseName,
      'tissueType': instance.tissueType,
      'diseaseNotices': instance.diseaseNotices,
      'diagnosticMedicalInstitutionName':
          instance.diagnosticMedicalInstitutionName,
      'pastIllnessFamilyHistory': instance.pastIllnessFamilyHistory,
      'referralMedicalInstitutionEtc': instance.referralMedicalInstitutionEtc,
      'diseaseCourseSndTestResultsEtc': instance.diseaseCourseSndTestResultsEtc,
      'symptoms': instance.symptoms,
      'notices': instance.notices,
      'metastasis': instance.metastasis,
      'radiationTreatmentOrNot': instance.radiationTreatmentOrNot,
      'presenceOfAnticancerDrugTreatment':
          instance.presenceOfAnticancerDrugTreatment,
      'biopsy': instance.biopsy,
      'patientsWishes': instance.patientsWishes,
      'agentName': instance.agentName,
      'personInChargeName': instance.personInChargeName,
      'mobileNumber': instance.mobileNumber,
      'patientsAddressStay': instance.patientsAddressStay,
      'emergencyContact': instance.emergencyContact,
      'remarks': instance.remarks,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
