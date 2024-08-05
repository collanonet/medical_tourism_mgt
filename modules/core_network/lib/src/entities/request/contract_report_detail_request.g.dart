// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_report_detail_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractReportDetailRequest _$ContractReportDetailRequestFromJson(
        Map<String, dynamic> json) =>
    ContractReportDetailRequest(
      uploadFile: json['uploadFile'] as String?,
      version: json['version'] as String?,
      updatedOn: json['updatedOn'] == null
          ? null
          : DateTime.parse(json['updatedOn'] as String),
      subject: json['subject'] as String?,
      operation: json['operation'] as String?,
    );

Map<String, dynamic> _$ContractReportDetailRequestToJson(
        ContractReportDetailRequest instance) =>
    <String, dynamic>{
      'uploadFile': instance.uploadFile,
      'version': instance.version,
      'updatedOn': instance.updatedOn?.toIso8601String(),
      'subject': instance.subject,
      'operation': instance.operation,
    };
