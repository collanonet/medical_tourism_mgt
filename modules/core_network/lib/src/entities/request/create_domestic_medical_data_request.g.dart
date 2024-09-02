// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_domestic_medical_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomesticMedicalDataRequest _$DomesticMedicalDataRequestFromJson(
        Map<String, dynamic> json) =>
    DomesticMedicalDataRequest(
      file: json['file'] as String?,
      medicalInstitutionName: json['medicalInstitutionName'] as String?,
      category: json['category'] as String?,
      documentName: json['documentName'] as String?,
      remarks: json['remarks'] as String?,
      dateOfIssue: json['dateOfIssue'] == null
          ? null
          : DateTime.parse(json['dateOfIssue'] as String),
      url: json['url'] as String?,
      disclosureToPatient: json['disclosureToPatient'] as bool?,
      disclosureToOtherMedicalInstitutions:
          json['disclosureToOtherMedicalInstitutions'] as bool?,
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$DomesticMedicalDataRequestToJson(
        DomesticMedicalDataRequest instance) =>
    <String, dynamic>{
      'file': instance.file,
      'medicalInstitutionName': instance.medicalInstitutionName,
      'category': instance.category,
      'documentName': instance.documentName,
      'remarks': instance.remarks,
      'dateOfIssue': instance.dateOfIssue?.toIso8601String(),
      'url': instance.url,
      'disclosureToPatient': instance.disclosureToPatient,
      'disclosureToOtherMedicalInstitutions':
          instance.disclosureToOtherMedicalInstitutions,
      'medicalRecord': instance.medicalRecord,
    };
