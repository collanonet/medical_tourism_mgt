// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_contract_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportContractResponse _$ReportContractResponseFromJson(
        Map<String, dynamic> json) =>
    ReportContractResponse(
      id: json['_id'] as String?,
      contractA: json['contractA'] as String?,
      contractB: json['contractB'] as String?,
      documentName: json['documentName'] as String?,
      updatedOn: json['updatedOn'] as String?,
      contractWithHospital: json['contractWithHospital'] as String?,
      fasteningMethod: json['fasteningMethod'] as String?,
    );

Map<String, dynamic> _$ReportContractResponseToJson(
        ReportContractResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'contractA': instance.contractA,
      'contractB': instance.contractB,
      'documentName': instance.documentName,
      'updatedOn': instance.updatedOn,
      'contractWithHospital': instance.contractWithHospital,
      'fasteningMethod': instance.fasteningMethod,
    };
