import 'package:json_annotation/json_annotation.dart';
part 'sale_total_response.g.dart';
@JsonSerializable()
class TotalResponse {
   @JsonKey(name: '_id')
  String id;
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

  TotalResponse({
    required this.id,
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
  factory TotalResponse.fromJson(Map<String, dynamic> json) => _$TotalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TotalResponseToJson(this);

}