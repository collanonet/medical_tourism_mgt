// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_patient_response_medical_checkup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordPatientResponseMedicalCheckupRequest
    _$MedicalRecordPatientResponseMedicalCheckupRequestFromJson(
            Map<String, dynamic> json) =>
        MedicalRecordPatientResponseMedicalCheckupRequest(
          date1: json['date1'] == null
              ? null
              : DateTime.parse(json['date1'] as String),
          date2: json['date2'] == null
              ? null
              : DateTime.parse(json['date2'] as String),
          date3: json['date3'] == null
              ? null
              : DateTime.parse(json['date3'] as String),
          desiredDate: json['desiredDate'] as bool?,
          remarks: json['remarks'] as String?,
          numberOfPeopleRequestingMedicalCheckup:
              json['numberOfPeopleRequestingMedicalCheckup'] as int?,
          age: json['age'] as int?,
          sex: json['sex'] as bool?,
          relationshipBetweenPerson:
              json['relationshipBetweenPerson'] as String?,
          isThereMedicalInstitutionToAttend:
              json['isThereMedicalInstitutionToAttend'] as bool?,
          desiredAreaOrMedicalInstitutionName:
              json['desiredAreaOrMedicalInstitutionName'] as String?,
          reason: json['reason'] as String?,
          petCT: json['petCT'] as bool?,
          mri: json['mri'] as bool?,
          gastroscope: json['gastroscope'] as bool?,
          freeInput: json['freeInput'] as String?,
          currentConcerns: json['currentConcerns'] as String?,
          brokerageCompanyOrIntroducer:
              json['brokerageCompanyOrIntroducer'] as String?,
          historyOfCancer: json['historyOfCancer'] as bool?,
          cancerSite: json['cancerSite'] as String?,
          currentlyDiabetes: json['currentlyDiabetes'] as bool?,
          diabetesMedication: json['diabetesMedication'] as bool?,
          fastingBloodSugarMgPerDl: json['fastingBloodSugarMgPerDl'] as int?,
          fastingBloodSugarMmolPerL: json['fastingBloodSugarMmolPerL'] as int?,
          implant: json['implant'] as bool?,
          implantYear: json['implantYear'] as int?,
          implantMonth: json['implantMonth'] as int?,
          bodyMetalOrTattoo: json['bodyMetalOrTattoo'] as bool?,
          hadMriAfterMetalOrTattoo: json['hadMriAfterMetalOrTattoo'] as bool?,
          partAndItsMaterial: json['partAndItsMaterial'] as String?,
          claustrophobia: json['claustrophobia'] as bool?,
          medicalRecord: json['medicalRecord'] as String,
        );

Map<String, dynamic> _$MedicalRecordPatientResponseMedicalCheckupRequestToJson(
        MedicalRecordPatientResponseMedicalCheckupRequest instance) =>
    <String, dynamic>{
      'date1': instance.date1?.toIso8601String(),
      'date2': instance.date2?.toIso8601String(),
      'date3': instance.date3?.toIso8601String(),
      'desiredDate': instance.desiredDate,
      'remarks': instance.remarks,
      'numberOfPeopleRequestingMedicalCheckup':
          instance.numberOfPeopleRequestingMedicalCheckup,
      'age': instance.age,
      'sex': instance.sex,
      'relationshipBetweenPerson': instance.relationshipBetweenPerson,
      'isThereMedicalInstitutionToAttend':
          instance.isThereMedicalInstitutionToAttend,
      'desiredAreaOrMedicalInstitutionName':
          instance.desiredAreaOrMedicalInstitutionName,
      'reason': instance.reason,
      'petCT': instance.petCT,
      'mri': instance.mri,
      'gastroscope': instance.gastroscope,
      'freeInput': instance.freeInput,
      'currentConcerns': instance.currentConcerns,
      'brokerageCompanyOrIntroducer': instance.brokerageCompanyOrIntroducer,
      'historyOfCancer': instance.historyOfCancer,
      'cancerSite': instance.cancerSite,
      'currentlyDiabetes': instance.currentlyDiabetes,
      'diabetesMedication': instance.diabetesMedication,
      'fastingBloodSugarMgPerDl': instance.fastingBloodSugarMgPerDl,
      'fastingBloodSugarMmolPerL': instance.fastingBloodSugarMmolPerL,
      'implant': instance.implant,
      'implantYear': instance.implantYear,
      'implantMonth': instance.implantMonth,
      'bodyMetalOrTattoo': instance.bodyMetalOrTattoo,
      'hadMriAfterMetalOrTattoo': instance.hadMriAfterMetalOrTattoo,
      'partAndItsMaterial': instance.partAndItsMaterial,
      'claustrophobia': instance.claustrophobia,
      'medicalRecord': instance.medicalRecord,
    };
