// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_master_report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstimatemasterReportRequest _$EstimatemasterReportRequestFromJson(
        Map<String, dynamic> json) =>
    EstimatemasterReportRequest(
      item: json['item'] as String?,
      sellUnitPrice: json['sellUnitPrice'] as String?,
      sellAmountOfMoney: json['sellAmountOfMoney'] as String?,
      costUnitPrice: json['costUnitPrice'] as String?,
      costAmountOfMoney: json['costAmountOfMoney'] as String?,
    );

Map<String, dynamic> _$EstimatemasterReportRequestToJson(
        EstimatemasterReportRequest instance) =>
    <String, dynamic>{
      'item': instance.item,
      'sellUnitPrice': instance.sellUnitPrice,
      'sellAmountOfMoney': instance.sellAmountOfMoney,
      'costUnitPrice': instance.costUnitPrice,
      'costAmountOfMoney': instance.costAmountOfMoney,
    };
