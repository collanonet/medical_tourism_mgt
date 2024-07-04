// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_total_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalResponse _$TotalResponseFromJson(Map<String, dynamic> json) =>
    TotalResponse(
      id: json['_id'] as String,
      totalSales: (json['totalSales'] as num?)?.toInt(),
      totalSaleTax: (json['totalSaleTax'] as num?)?.toInt(),
      totalCost: json['totalCost'] as String?,
      totalCostTax: json['totalCostTax'] as String?,
      grossProfit: json['grossProfit'] as String?,
      grossProfitTax: json['grossProfitTax'] as String?,
      taxIncluded: json['taxIncluded'] as String?,
      taxExcluded: json['taxExcluded'] as String?,
      taxExempt: json['taxExempt'] as String?,
      grossProfitTax2: json['grossProfitTax2'] as String?,
    );

Map<String, dynamic> _$TotalResponseToJson(TotalResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'totalSales': instance.totalSales,
      'totalSaleTax': instance.totalSaleTax,
      'totalCost': instance.totalCost,
      'totalCostTax': instance.totalCostTax,
      'grossProfit': instance.grossProfit,
      'grossProfitTax': instance.grossProfitTax,
      'taxIncluded': instance.taxIncluded,
      'taxExcluded': instance.taxExcluded,
      'taxExempt': instance.taxExempt,
      'grossProfitTax2': instance.grossProfitTax2,
    };
