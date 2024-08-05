// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportContractRequest _$ReportContractRequestFromJson(
        Map<String, dynamic> json) =>
    ReportContractRequest(
      contractA: json['contractA'] as String?,
      contractB: json['contractB'] as String?,
      documentName: json['documentName'] as String?,
      updatedOn: json['updatedOn'] as String?,
      contractWithHospital: json['contractWithHospital'] as String?,
      fasteningMethod: json['fasteningMethod'] as String?,
    );

Map<String, dynamic> _$ReportContractRequestToJson(
        ReportContractRequest instance) =>
    <String, dynamic>{
      'contractA': instance.contractA,
      'contractB': instance.contractB,
      'documentName': instance.documentName,
      'updatedOn': instance.updatedOn,
      'contractWithHospital': instance.contractWithHospital,
      'fasteningMethod': instance.fasteningMethod,
    };
