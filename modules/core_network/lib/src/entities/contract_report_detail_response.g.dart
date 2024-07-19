// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_report_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractReportDetailResponse _$ContractReportDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ContractReportDetailResponse(
      id: json['_id'] as String,
      uploadFile: json['uploadFile'] as String?,
      version: json['version'] as String?,
      updatedOn: json['updatedOn'] == null
          ? null
          : DateTime.parse(json['updatedOn'] as String),
      subject: json['subject'] as String?,
      operation: json['operation'] as String?,
    );

Map<String, dynamic> _$ContractReportDetailResponseToJson(
        ContractReportDetailResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uploadFile': instance.uploadFile,
      'version': instance.version,
      'updatedOn': instance.updatedOn?.toIso8601String(),
      'subject': instance.subject,
      'operation': instance.operation,
    };
