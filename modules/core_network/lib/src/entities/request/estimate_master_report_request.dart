import 'package:json_annotation/json_annotation.dart';
part 'estimate_master_report_request.g.dart';
@JsonSerializable()
class EstimatemasterReportRequest {
  String? item;
  String? sellUnitPrice;
  String? sellAmountOfMoney;
  String? costUnitPrice;
  String? costAmountOfMoney;

  EstimatemasterReportRequest({
    this.item,
    this.sellUnitPrice,
    this.sellAmountOfMoney,
    this.costUnitPrice,
    this.costAmountOfMoney,
  });

  factory EstimatemasterReportRequest.fromJson(Map<String, dynamic> json) => _$EstimatemasterReportRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EstimatemasterReportRequestToJson(this);
}