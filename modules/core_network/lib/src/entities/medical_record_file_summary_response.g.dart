// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_file_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordFileSummaryResponse _$MedicalRecordFileSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordFileSummaryResponse(
      id: json['_id'] as String,
      pathFile: json['pathFile'] as String?,
      documentName: json['documentName'] as String?,
      publicationDate: json['publicationDate'] == null
          ? null
          : DateTime.parse(json['publicationDate'] as String),
      share: json['share'] as String?,
      disclosureToAgent: json['disclosureToAgent'] as String?,
      recordSummary: json['recordSummary'] as String,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordFileSummaryResponseToJson(
        MedicalRecordFileSummaryResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'pathFile': instance.pathFile,
      'documentName': instance.documentName,
      'publicationDate': instance.publicationDate?.toIso8601String(),
      'share': instance.share,
      'disclosureToAgent': instance.disclosureToAgent,
      'recordSummary': instance.recordSummary,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
