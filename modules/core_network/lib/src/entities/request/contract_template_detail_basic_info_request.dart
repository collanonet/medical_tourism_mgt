// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'contract_template_detail_basic_info_request.g.dart';
@JsonSerializable()
class ContractTemplateBasicInformationRequest {
  String? file;
  String? version;
  DateTime? updateDate;
  String? documentName;
  String? first;
  String? second;
  String? c;
  String? methodOfConclusion;
  String? contractPartnerInCaseOfHospital;
  bool? user;

  ContractTemplateBasicInformationRequest({
    this.file,
    this.version,
    this.updateDate,
    this.documentName,
    this.first,
    this.second,
    this.c,
    this.methodOfConclusion,
    this.contractPartnerInCaseOfHospital,
    this.user,
  });

  factory ContractTemplateBasicInformationRequest.fromJson(Map<String, dynamic> json) => _$ContractTemplateBasicInformationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ContractTemplateBasicInformationRequestToJson(this);
}
