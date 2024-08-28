// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'contract_report_detail_request.g.dart';
@JsonSerializable()
class ContractReportDetailRequest {
  String? uploadFile;
  String? version;
  DateTime? updatedOn;
  String? subject;
  String? operation;

  ContractReportDetailRequest({
    this.uploadFile,
    this.version,
    this.updatedOn,
    this.subject,
    this.operation,
  });

  factory ContractReportDetailRequest.fromJson(Map<String,dynamic> json){
    return _$ContractReportDetailRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$ContractReportDetailRequestToJson(this);
  }
}
