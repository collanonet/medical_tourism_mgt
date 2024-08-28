// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'sale_service_free_response.g.dart';
@JsonSerializable()
class ServiceFeeResponse {
  @JsonKey(name: '_id')
  String id;
  List<ServiceItemResponse> serviceItem;
  int? amountOfMoneyTotalSale;
  int? amountOfMoneyTotalTax;
  int? amountOfMoneyTotalAmount;
  int? costSale;
  int? costTax;
  int? costAmount;
  int? profitSale;
  int? profitTax;
  int? profitAmount;
  String? tax;
  String? taxExcluded;
  String? taxExempt;

  ServiceFeeResponse({
    required this.id,
    required this.serviceItem,
    this.amountOfMoneyTotalSale,
    this.amountOfMoneyTotalTax,
    this.amountOfMoneyTotalAmount,
    this.costSale,
    this.costTax,
    this.costAmount,
    this.profitSale,
    this.profitTax,
    this.profitAmount,
    this.tax,
    this.taxExcluded,
    this.taxExempt,
  });
  factory ServiceFeeResponse.fromJson(Map<String, dynamic> json) => _$ServiceFeeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceFeeResponseToJson(this);
}

@JsonSerializable()
class ServiceItemResponse {
  String? item;
  int? quantity;
  String? unit;
  int? unitPrice;
  int? amountOfMoney;
  int? cost;
  int? profit;
  int? invoiceNo;
  int? paymentDocumentNo;

  ServiceItemResponse({
    this.item,
    this.quantity,
    this.unit,
    this.unitPrice,
    this.amountOfMoney,
    this.cost,
    this.profit,
    this.invoiceNo,
    this.paymentDocumentNo,
  });

  factory ServiceItemResponse.fromJson(Map<String, dynamic> json) => _$ServiceItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceItemResponseToJson(this);
}
