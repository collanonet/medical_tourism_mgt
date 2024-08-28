// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'sale_service_free_request.g.dart';
@JsonSerializable()
class ServiceFeeRequest {
  List<ServiceItem> serviceItem;
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

  ServiceFeeRequest({
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
  factory ServiceFeeRequest.fromJson(Map<String, dynamic> json){
    return _$ServiceFeeRequestFromJson(json);
  }
  Map<String, dynamic> toJson(){
    return _$ServiceFeeRequestToJson(this);
  }
}

@JsonSerializable()
class ServiceItem {
  String? item;
  int? quantity;
  String? unit;
  int? unitPrice;
  int? amountOfMoney;
  int? cost;
  int? profit;
  int? invoiceNo;
  int? paymentDocumentNo;

  ServiceItem({
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
  factory ServiceItem.fromJson(Map<String, dynamic> json){
    return _$ServiceItemFromJson(json);
  }
  Map<String, dynamic> toJson(){
    return _$ServiceItemToJson(this);
  }
}
