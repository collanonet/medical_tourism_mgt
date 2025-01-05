// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'contract_template_detail_basic_info_response.g.dart';

@JsonSerializable()
class ContractTemplateBasicInformationResponse {
  @JsonKey(name: '_id')
  final String id;
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

  ContractTemplateBasicInformationResponse({
    required this.id,
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

  factory ContractTemplateBasicInformationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ContractTemplateBasicInformationResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ContractTemplateBasicInformationResponseToJson(this);
}
