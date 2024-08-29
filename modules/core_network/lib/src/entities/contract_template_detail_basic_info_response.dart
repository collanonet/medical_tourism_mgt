// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'contract_template_detail_basic_info_response.g.dart';
@JsonSerializable()
class ContractTemplateBasicInformationResponse {
  @JsonKey(name: '_id')
  final String id;
  String? version;
  String? documentName;
  String? contractA;
  String? contractB;
  String? contractC;
  String? fasteningMethod;
  String? contractingPartyForHospitals;
  bool? operation;

  ContractTemplateBasicInformationResponse({
    required this.id,
    this.version,
    this.documentName,
    this.contractA,
    this.contractB,
    this.contractC,
    this.fasteningMethod,
    this.contractingPartyForHospitals,
    this.operation,
  });

  factory ContractTemplateBasicInformationResponse.fromJson(Map<String, dynamic> json) => _$ContractTemplateBasicInformationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ContractTemplateBasicInformationResponseToJson(this);
}
