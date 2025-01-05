// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_template_detail_basic_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractTemplateBasicInformationRequest
    _$ContractTemplateBasicInformationRequestFromJson(
            Map<String, dynamic> json) =>
        ContractTemplateBasicInformationRequest(
          file: json['file'] as String?,
          version: json['version'] as String?,
          updateDate: json['updateDate'] == null
              ? null
              : DateTime.parse(json['updateDate'] as String),
          documentName: json['documentName'] as String?,
          first: json['first'] as String?,
          second: json['second'] as String?,
          c: json['c'] as String?,
          methodOfConclusion: json['methodOfConclusion'] as String?,
          contractPartnerInCaseOfHospital:
              json['contractPartnerInCaseOfHospital'] as String?,
          user: json['user'] as bool?,
        );

Map<String, dynamic> _$ContractTemplateBasicInformationRequestToJson(
        ContractTemplateBasicInformationRequest instance) =>
    <String, dynamic>{
      'file': instance.file,
      'version': instance.version,
      'updateDate': instance.updateDate?.toIso8601String(),
      'documentName': instance.documentName,
      'first': instance.first,
      'second': instance.second,
      'c': instance.c,
      'methodOfConclusion': instance.methodOfConclusion,
      'contractPartnerInCaseOfHospital':
          instance.contractPartnerInCaseOfHospital,
      'user': instance.user,
    };
