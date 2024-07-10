import 'package:json_annotation/json_annotation.dart';
part 'contrant_request.g.dart';
@JsonSerializable()
class ContractRequest{
  String? uploadFile;
  String? fileName;
  DateTime? uploadDate;

  ContractRequest({
    this.uploadFile,
    this.fileName,
    this.uploadDate
  });

  factory ContractRequest.fromJson(Map<String, dynamic> json) => _$ContractRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ContractRequestToJson(this);
  
}