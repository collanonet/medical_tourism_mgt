// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_explenses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpensesResponse _$ExpensesResponseFromJson(Map<String, dynamic> json) =>
    ExpensesResponse(
      id: json['_id'] as String,
      majorItems: json['majorItems'] as String?,
      subitems: (json['subitems'] as List<dynamic>?)
          ?.map((e) => Subitem.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantity: json['quantity'] as int?,
      unit: json['unit'] as String?,
      unitPrice: json['unitPrice'] as int?,
      amountOfMoney: json['amountOfMoney'] as int?,
      paymentDocument: json['paymentDocument'] as int?,
      totalExpenses: json['totalExpenses'] as int?,
      totalExpensesTax: json['totalExpensesTax'] as int?,
      totalExpensesAmount: json['totalExpensesAmount'] as int?,
      typeOfTax: json['typeOfTax'] as String?,
    );

Map<String, dynamic> _$ExpensesResponseToJson(ExpensesResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'majorItems': instance.majorItems,
      'subitems': instance.subitems,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'unitPrice': instance.unitPrice,
      'amountOfMoney': instance.amountOfMoney,
      'paymentDocument': instance.paymentDocument,
      'totalExpenses': instance.totalExpenses,
      'totalExpensesTax': instance.totalExpensesTax,
      'totalExpensesAmount': instance.totalExpensesAmount,
      'typeOfTax': instance.typeOfTax,
    };
