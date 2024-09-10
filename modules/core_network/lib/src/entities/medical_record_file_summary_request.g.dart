// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_file_summary_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordFileSummaryRequest _$MedicalRecordFileSummaryRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordFileSummaryRequest(
      pathFile: json['pathFile'] as String?,
      documentName: json['documentName'] as String?,
      publicationDate: json['publicationDate'] == null
          ? null
          : DateTime.parse(json['publicationDate'] as String),
      share: json['share'] as String?,
      disclosureToAgent: json['disclosureToAgent'] as String?,
      recordSummary: json['recordSummary'] as String,
      medicalRecord: json['medicalRecord'] as String,
    );

Map<String, dynamic> _$MedicalRecordFileSummaryRequestToJson(
        MedicalRecordFileSummaryRequest instance) =>
    <String, dynamic>{
      'pathFile': instance.pathFile,
      'documentName': instance.documentName,
      'publicationDate': instance.publicationDate?.toIso8601String(),
      'share': instance.share,
      'disclosureToAgent': instance.disclosureToAgent,
      'recordSummary': instance.recordSummary,
      'medicalRecord': instance.medicalRecord,
    };
