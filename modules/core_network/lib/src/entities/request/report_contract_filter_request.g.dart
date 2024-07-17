// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_contract_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractFilterRequest _$ContractFilterRequestFromJson(
        Map<String, dynamic> json) =>
    ContractFilterRequest(
      agreementName: json['agreementName'] as String?,
      contractA: json['contractA'] as String?,
      contractB: json['contractB'] as String?,
      fasteningMethod: json['fasteningMethod'] as String?,
    );

Map<String, dynamic> _$ContractFilterRequestToJson(
        ContractFilterRequest instance) =>
    <String, dynamic>{
      'agreementName': instance.agreementName,
      'contractA': instance.contractA,
      'contractB': instance.contractB,
      'fasteningMethod': instance.fasteningMethod,
    };
