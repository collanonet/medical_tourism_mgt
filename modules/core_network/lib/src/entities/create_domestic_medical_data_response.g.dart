// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_domestic_medical_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomesticMedicalDataResponse _$DomesticMedicalDataResponseFromJson(
        Map<String, dynamic> json) =>
    DomesticMedicalDataResponse(
      id: json['_id'] as String,
      file: json['file'] as String?,
      nameOfMedicalInstitution: json['nameOfMedicalInstitution'] as String?,
      category: json['category'] as String?,
      documentName: json['documentName'] as String?,
      remark: json['remark'] as String?,
      dateOfIssue: json['dateOfIssue'] == null
          ? null
          : DateTime.parse(json['dateOfIssue'] as String),
      sharedUrlIssue: json['sharedUrlIssue'] as String?,
      disclosureToPatients: json['disclosureToPatients'] as String?,
      disclosureToOtherMedicalInstitutions:
          json['disclosureToOtherMedicalInstitutions'] as String?,
    );

Map<String, dynamic> _$DomesticMedicalDataResponseToJson(
        DomesticMedicalDataResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'file': instance.file,
      'nameOfMedicalInstitution': instance.nameOfMedicalInstitution,
      'category': instance.category,
      'documentName': instance.documentName,
      'remark': instance.remark,
      'dateOfIssue': instance.dateOfIssue?.toIso8601String(),
      'sharedUrlIssue': instance.sharedUrlIssue,
      'disclosureToPatients': instance.disclosureToPatients,
      'disclosureToOtherMedicalInstitutions':
          instance.disclosureToOtherMedicalInstitutions,
    };
