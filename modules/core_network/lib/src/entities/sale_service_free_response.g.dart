// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_service_free_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceFeeResponse _$ServiceFeeResponseFromJson(Map<String, dynamic> json) =>
    ServiceFeeResponse(
      id: json['_id'] as String,
      serviceItem: (json['serviceItem'] as List<dynamic>)
          .map((e) => ServiceItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      amountOfMoneyTotalSale: json['amountOfMoneyTotalSale'] as int?,
      amountOfMoneyTotalTax: json['amountOfMoneyTotalTax'] as int?,
      amountOfMoneyTotalAmount: json['amountOfMoneyTotalAmount'] as int?,
      costSale: json['costSale'] as int?,
      costTax: json['costTax'] as int?,
      costAmount: json['costAmount'] as int?,
      profitSale: json['profitSale'] as int?,
      profitTax: json['profitTax'] as int?,
      profitAmount: json['profitAmount'] as int?,
      tax: json['tax'] as String?,
      taxExcluded: json['taxExcluded'] as String?,
      taxExempt: json['taxExempt'] as String?,
    );

Map<String, dynamic> _$ServiceFeeResponseToJson(ServiceFeeResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'serviceItem': instance.serviceItem,
      'amountOfMoneyTotalSale': instance.amountOfMoneyTotalSale,
      'amountOfMoneyTotalTax': instance.amountOfMoneyTotalTax,
      'amountOfMoneyTotalAmount': instance.amountOfMoneyTotalAmount,
      'costSale': instance.costSale,
      'costTax': instance.costTax,
      'costAmount': instance.costAmount,
      'profitSale': instance.profitSale,
      'profitTax': instance.profitTax,
      'profitAmount': instance.profitAmount,
      'tax': instance.tax,
      'taxExcluded': instance.taxExcluded,
      'taxExempt': instance.taxExempt,
    };

ServiceItemResponse _$ServiceItemResponseFromJson(Map<String, dynamic> json) =>
    ServiceItemResponse(
      item: json['item'] as String?,
      quantity: json['quantity'] as int?,
      unit: json['unit'] as String?,
      unitPrice: json['unitPrice'] as int?,
      amountOfMoney: json['amountOfMoney'] as int?,
      cost: json['cost'] as int?,
      profit: json['profit'] as int?,
      invoiceNo: json['invoiceNo'] as int?,
      paymentDocumentNo: json['paymentDocumentNo'] as int?,
    );

Map<String, dynamic> _$ServiceItemResponseToJson(
        ServiceItemResponse instance) =>
    <String, dynamic>{
      'item': instance.item,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'unitPrice': instance.unitPrice,
      'amountOfMoney': instance.amountOfMoney,
      'cost': instance.cost,
      'profit': instance.profit,
      'invoiceNo': instance.invoiceNo,
      'paymentDocumentNo': instance.paymentDocumentNo,
    };
