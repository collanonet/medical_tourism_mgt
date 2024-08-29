// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'contract_template_detail_basic_info_request.g.dart';
@JsonSerializable()
class ContractTemplateBasicInformationRequest {
  String? version;
  String? documentName;
  String? contractA;
  String? contractB;
  String? contractC;
  String? fasteningMethod;
  String? contractingPartyForHospitals;
  bool? operation;

  ContractTemplateBasicInformationRequest({
    this.version,
    this.documentName,
    this.contractA,
    this.contractB,
    this.contractC,
    this.fasteningMethod,
    this.contractingPartyForHospitals,
    this.operation,
  });

  factory ContractTemplateBasicInformationRequest.fromJson(Map<String, dynamic> json) => _$ContractTemplateBasicInformationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ContractTemplateBasicInformationRequestToJson(this);
}
