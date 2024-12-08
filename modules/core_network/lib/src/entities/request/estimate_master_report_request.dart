// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'estimate_master_report_request.g.dart';
@JsonSerializable()
class EstimatemasterReportRequest {
  String? project;
  String? unitPriceSellingPrice;
  String? amountOfMoneySellingPrice;
  String? unitPriceCostPrice;
  String? amountOfMoneyCostPrice;

  EstimatemasterReportRequest({
    this.project,
    this.unitPriceSellingPrice,
    this.amountOfMoneySellingPrice,
    this.unitPriceCostPrice,
    this.amountOfMoneyCostPrice,
  });

  factory EstimatemasterReportRequest.fromJson(Map<String, dynamic> json) => _$EstimatemasterReportRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EstimatemasterReportRequestToJson(this);
}
