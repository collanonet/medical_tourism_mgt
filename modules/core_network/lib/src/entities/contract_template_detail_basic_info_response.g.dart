// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_template_detail_basic_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractTemplateBasicInformationResponse
    _$ContractTemplateBasicInformationResponseFromJson(
            Map<String, dynamic> json) =>
        ContractTemplateBasicInformationResponse(
          id: json['_id'] as String,
          version: json['version'] as String?,
          documentName: json['documentName'] as String?,
          contractA: json['contractA'] as String?,
          contractB: json['contractB'] as String?,
          contractC: json['contractC'] as String?,
          fasteningMethod: json['fasteningMethod'] as String?,
          contractingPartyForHospitals:
              json['contractingPartyForHospitals'] as String?,
          operation: json['operation'] as bool?,
        );

Map<String, dynamic> _$ContractTemplateBasicInformationResponseToJson(
        ContractTemplateBasicInformationResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'version': instance.version,
      'documentName': instance.documentName,
      'contractA': instance.contractA,
      'contractB': instance.contractB,
      'contractC': instance.contractC,
      'fasteningMethod': instance.fasteningMethod,
      'contractingPartyForHospitals': instance.contractingPartyForHospitals,
      'operation': instance.operation,
    };
