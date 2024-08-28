// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'contract_report_detail_response.g.dart';
@JsonSerializable()
class ContractReportDetailResponse {
  @JsonKey(name: '_id')
  final String id;
  String? uploadFile;
  String? version;
  DateTime? updatedOn;
  String? subject;
  String? operation;

  ContractReportDetailResponse({
    required this.id,
    this.uploadFile,
    this.version,
    this.updatedOn,
    this.subject,
    this.operation,
  });

  factory ContractReportDetailResponse.fromJson(Map<String,dynamic> json){
    return _$ContractReportDetailResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$ContractReportDetailResponseToJson(this);
  }
}
