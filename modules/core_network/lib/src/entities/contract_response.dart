import 'package:json_annotation/json_annotation.dart';
part 'contract_response.g.dart';
@JsonSerializable()
class ContractResponse{
   @JsonKey(name: '_id')
  final String id;
  String? uploadFile;
  String? fileName;
  DateTime? uploadDate;

  ContractResponse({
    required this.id,
    this.uploadFile,
    this.fileName,
    this.uploadDate
  });

  factory ContractResponse.fromJson(Map<String, dynamic> json) => _$ContractResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ContractResponseToJson(this);
  
}