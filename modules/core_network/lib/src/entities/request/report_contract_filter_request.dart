import 'package:json_annotation/json_annotation.dart';
part 'report_contract_filter_request.g.dart';

@JsonSerializable()
class ContractFilterRequest {
  String? agreementName;
  String? contractA;
  String? contractB;
  String? fasteningMethod;

  ContractFilterRequest({
    this.agreementName,
    this.contractA,
    this.contractB,
    this.fasteningMethod,
  });

  factory ContractFilterRequest.fromJson(Map<String, dynamic> json) => _$ContractFilterRequestFromJson(json);
  Map<String,dynamic> toJson() => _$ContractFilterRequestToJson(this);
}
