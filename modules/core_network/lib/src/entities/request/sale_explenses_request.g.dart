// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_explenses_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpensesRequest _$ExpensesRequestFromJson(Map<String, dynamic> json) =>
    ExpensesRequest(
      majorItems: json['majorItems'] as String?,
      subitems: (json['subitems'] as List<dynamic>?)
          ?.map((e) => Subitem.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantity: (json['quantity'] as num?)?.toInt(),
      unit: json['unit'] as String?,
      unitPrice: (json['unitPrice'] as num?)?.toInt(),
      amountOfMoney: (json['amountOfMoney'] as num?)?.toInt(),
      paymentDocument: (json['paymentDocument'] as num?)?.toInt(),
      totalExpenses: (json['totalExpenses'] as num?)?.toInt(),
      totalExpensesTax: (json['totalExpensesTax'] as num?)?.toInt(),
      totalExpensesAmount: (json['totalExpensesAmount'] as num?)?.toInt(),
      typeOfTax: json['typeOfTax'] as String?,
    );

Map<String, dynamic> _$ExpensesRequestToJson(ExpensesRequest instance) =>
    <String, dynamic>{
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

Subitem _$SubitemFromJson(Map<String, dynamic> json) => Subitem(
      submit: json['submit'] as String?,
    );

Map<String, dynamic> _$SubitemToJson(Subitem instance) => <String, dynamic>{
      'submit': instance.submit,
    };
