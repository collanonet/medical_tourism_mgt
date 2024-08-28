// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_total_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalRequest _$TotalRequestFromJson(Map<String, dynamic> json) => TotalRequest(
      totalSales: json['totalSales'] as int?,
      totalSaleTax: json['totalSaleTax'] as int?,
      totalCost: json['totalCost'] as String?,
      totalCostTax: json['totalCostTax'] as String?,
      grossProfit: json['grossProfit'] as String?,
      grossProfitTax: json['grossProfitTax'] as String?,
      taxIncluded: json['taxIncluded'] as String?,
      taxExcluded: json['taxExcluded'] as String?,
      taxExempt: json['taxExempt'] as String?,
      grossProfitTax2: json['grossProfitTax2'] as String?,
    );

Map<String, dynamic> _$TotalRequestToJson(TotalRequest instance) =>
    <String, dynamic>{
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
