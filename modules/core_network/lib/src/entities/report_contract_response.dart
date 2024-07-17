import 'package:json_annotation/json_annotation.dart';
part 'report_contract_response.g.dart';

@JsonSerializable()
class ReportContractResponse {
    @JsonKey(name: '_id')
  final String? id;
  String? contractA;
  String? contractB;
  String? documentName;
  String? updatedOn;
  String? contractWithHospital;
  String? fasteningMethod;
  ReportContractResponse({
    required this.id,
    this.contractA,
    this.contractB,
    this.documentName,
    this.updatedOn,
    this.contractWithHospital,
    this.fasteningMethod,
  });

  factory ReportContractResponse.fromJson(Map<String, dynamic> json) => _$ReportContractResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReportContractResponseToJson(this);
}
