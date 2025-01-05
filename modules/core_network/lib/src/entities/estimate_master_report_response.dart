// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'estimate_master_report_response.g.dart';
@JsonSerializable()
class EstimatemasterReportResponse {
  @JsonKey(name: '_id')
  String id;
  String? project;
  String? unitPriceSellingPrice;
  String? amountOfMoneySellingPrice;
  String? unitPriceCostPrice;
  String? amountOfMoneyCostPrice;

  EstimatemasterReportResponse({
    required this.id,
    this.project,
    this.unitPriceSellingPrice,
    this.amountOfMoneySellingPrice,
    this.unitPriceCostPrice,
    this.amountOfMoneyCostPrice,
  });

  factory EstimatemasterReportResponse.fromJson(Map<String, dynamic> json) => _$EstimatemasterReportResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EstimatemasterReportResponseToJson(this);
}
