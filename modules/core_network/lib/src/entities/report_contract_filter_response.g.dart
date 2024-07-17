// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_contract_filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractFilterResponse _$ContractFilterResponseFromJson(
        Map<String, dynamic> json) =>
    ContractFilterResponse(
      id: json['_id'] as String,
      agreementName: json['agreementName'] as String?,
      contractA: json['contractA'] as String?,
      contractB: json['contractB'] as String?,
      fasteningMethod: json['fasteningMethod'] as String?,
    );

Map<String, dynamic> _$ContractFilterResponseToJson(
        ContractFilterResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'agreementName': instance.agreementName,
      'contractA': instance.contractA,
      'contractB': instance.contractB,
      'fasteningMethod': instance.fasteningMethod,
    };
