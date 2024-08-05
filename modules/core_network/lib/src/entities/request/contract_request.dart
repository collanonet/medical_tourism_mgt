import 'package:json_annotation/json_annotation.dart';
part 'contract_request.g.dart';

@JsonSerializable()
class ReportContractRequest {
  String? contractA;
  String? contractB;
  String? documentName;
  String? updatedOn;
  String? contractWithHospital;
  String? fasteningMethod;
  ReportContractRequest({
    this.contractA,
    this.contractB,
    this.documentName,
    this.updatedOn,
    this.contractWithHospital,
    this.fasteningMethod,
  });
  factory ReportContractRequest.fromJson(Map<String, dynamic> json) => _$ReportContractRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ReportContractRequestToJson(this);
}
