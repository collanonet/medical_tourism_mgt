// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_template_detail_basic_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractTemplateBasicInformationRequest
    _$ContractTemplateBasicInformationRequestFromJson(
            Map<String, dynamic> json) =>
        ContractTemplateBasicInformationRequest(
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

Map<String, dynamic> _$ContractTemplateBasicInformationRequestToJson(
        ContractTemplateBasicInformationRequest instance) =>
    <String, dynamic>{
      'version': instance.version,
      'documentName': instance.documentName,
      'contractA': instance.contractA,
      'contractB': instance.contractB,
      'contractC': instance.contractC,
      'fasteningMethod': instance.fasteningMethod,
      'contractingPartyForHospitals': instance.contractingPartyForHospitals,
      'operation': instance.operation,
    };
