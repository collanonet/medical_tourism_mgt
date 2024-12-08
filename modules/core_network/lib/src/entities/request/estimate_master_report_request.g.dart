// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_master_report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstimatemasterReportRequest _$EstimatemasterReportRequestFromJson(
        Map<String, dynamic> json) =>
    EstimatemasterReportRequest(
      project: json['project'] as String?,
      unitPriceSellingPrice: json['unitPriceSellingPrice'] as String?,
      amountOfMoneySellingPrice: json['amountOfMoneySellingPrice'] as String?,
      unitPriceCostPrice: json['unitPriceCostPrice'] as String?,
      amountOfMoneyCostPrice: json['amountOfMoneyCostPrice'] as String?,
    );

Map<String, dynamic> _$EstimatemasterReportRequestToJson(
        EstimatemasterReportRequest instance) =>
    <String, dynamic>{
      'project': instance.project,
      'unitPriceSellingPrice': instance.unitPriceSellingPrice,
      'amountOfMoneySellingPrice': instance.amountOfMoneySellingPrice,
      'unitPriceCostPrice': instance.unitPriceCostPrice,
      'amountOfMoneyCostPrice': instance.amountOfMoneyCostPrice,
    };
