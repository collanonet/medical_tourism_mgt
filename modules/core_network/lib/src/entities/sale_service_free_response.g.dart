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
      amountOfMoneyTotalSale: (json['amountOfMoneyTotalSale'] as num?)?.toInt(),
      amountOfMoneyTotalTax: (json['amountOfMoneyTotalTax'] as num?)?.toInt(),
      amountOfMoneyTotalAmount:
          (json['amountOfMoneyTotalAmount'] as num?)?.toInt(),
      costSale: (json['costSale'] as num?)?.toInt(),
      costTax: (json['costTax'] as num?)?.toInt(),
      costAmount: (json['costAmount'] as num?)?.toInt(),
      profitSale: (json['profitSale'] as num?)?.toInt(),
      profitTax: (json['profitTax'] as num?)?.toInt(),
      profitAmount: (json['profitAmount'] as num?)?.toInt(),
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
      quantity: (json['quantity'] as num?)?.toInt(),
      unit: json['unit'] as String?,
      unitPrice: (json['unitPrice'] as num?)?.toInt(),
      amountOfMoney: (json['amountOfMoney'] as num?)?.toInt(),
      cost: (json['cost'] as num?)?.toInt(),
      profit: (json['profit'] as num?)?.toInt(),
      invoiceNo: (json['invoiceNo'] as num?)?.toInt(),
      paymentDocumentNo: (json['paymentDocumentNo'] as num?)?.toInt(),
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
