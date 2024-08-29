// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'sale_total_request.g.dart';
@JsonSerializable()
class TotalRequest {
  int? totalSales;
  int? totalSaleTax;
  String? totalCost;
  String? totalCostTax;
  String? grossProfit;
  String? grossProfitTax;
  String? taxIncluded;
  String? taxExcluded;
  String? taxExempt;
  String? grossProfitTax2;

  TotalRequest({
    this.totalSales,
    this.totalSaleTax,
    this.totalCost,
    this.totalCostTax,
    this.grossProfit,
    this.grossProfitTax,
    this.taxIncluded,
    this.taxExcluded,
    this.taxExempt,
    this.grossProfitTax2,
  });

  factory TotalRequest.fromJson(Map<String, dynamic> json) => _$TotalRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TotalRequestToJson(this);

}
