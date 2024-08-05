// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_master_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstimateMasterResponse _$EstimateMasterResponseFromJson(
        Map<String, dynamic> json) =>
    EstimateMasterResponse(
      id: json['_id'] as String,
      item: json['item'] as String?,
      sellUnitPrice: json['sellUnitPrice'] as String?,
      sellAmountOfMoney: json['sellAmountOfMoney'] as String?,
      costUnitPrice: json['costUnitPrice'] as String?,
      costAmountOfMoney: json['costAmountOfMoney'] as String?,
    );

Map<String, dynamic> _$EstimateMasterResponseToJson(
        EstimateMasterResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'item': instance.item,
      'sellUnitPrice': instance.sellUnitPrice,
      'sellAmountOfMoney': instance.sellAmountOfMoney,
      'costUnitPrice': instance.costUnitPrice,
      'costAmountOfMoney': instance.costAmountOfMoney,
    };
