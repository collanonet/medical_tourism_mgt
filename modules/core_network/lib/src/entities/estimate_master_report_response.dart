// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'estimate_master_report_response.g.dart';
@JsonSerializable()
class EstimatemasterReportResponse {
  @JsonKey(name: '_id')
  String id;
  String? item;
  String? sellUnitPrice;
  String? sellAmountOfMoney;
  String? costUnitPrice;
  String? costAmountOfMoney;

  EstimatemasterReportResponse({
    required this.id,
    this.item,
    this.sellUnitPrice,
    this.sellAmountOfMoney,
    this.costUnitPrice,
    this.costAmountOfMoney,
  });

  factory EstimatemasterReportResponse.fromJson(Map<String, dynamic> json) => _$EstimatemasterReportResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EstimatemasterReportResponseToJson(this);
}
