import 'package:json_annotation/json_annotation.dart';
part 'report_contract_filter_response.g.dart';

@JsonSerializable()
class ContractFilterResponse {
  @JsonKey(name: '_id')
  final String id;
  String? agreementName;
  String? contractA;
  String? contractB;
  String? fasteningMethod;

  ContractFilterResponse({
    required this.id,
    this.agreementName,
    this.contractA,
    this.contractB,
    this.fasteningMethod,
  });

  factory ContractFilterResponse.fromJson(Map<String, dynamic> json) => _$ContractFilterResponseFromJson(json);

  Map<String,dynamic> toJson() => _$ContractFilterResponseToJson(this);
}
