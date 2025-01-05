// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_master_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstimatemasterReportResponse _$EstimatemasterReportResponseFromJson(
        Map<String, dynamic> json) =>
    EstimatemasterReportResponse(
      id: json['_id'] as String,
      project: json['project'] as String?,
      unitPriceSellingPrice: json['unitPriceSellingPrice'] as String?,
      amountOfMoneySellingPrice: json['amountOfMoneySellingPrice'] as String?,
      unitPriceCostPrice: json['unitPriceCostPrice'] as String?,
      amountOfMoneyCostPrice: json['amountOfMoneyCostPrice'] as String?,
    );

Map<String, dynamic> _$EstimatemasterReportResponseToJson(
        EstimatemasterReportResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'project': instance.project,
      'unitPriceSellingPrice': instance.unitPriceSellingPrice,
      'amountOfMoneySellingPrice': instance.amountOfMoneySellingPrice,
      'unitPriceCostPrice': instance.unitPriceCostPrice,
      'amountOfMoneyCostPrice': instance.amountOfMoneyCostPrice,
    };
