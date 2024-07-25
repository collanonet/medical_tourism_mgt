// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentMenuResponse _$TreatmentMenuResponseFromJson(
        Map<String, dynamic> json) =>
    TreatmentMenuResponse(
      id: json['_id'] as String,
      hospitalId: json['hospitalId'] as String?,
      project: json['project'] as String?,
      treatmentCostExcludingTax: json['treatmentCostExcludingTax'] as num?,
      treatmentCostIncludingTax: json['treatmentCostIncludingTax'] as num?,
      remark: json['remark'] as String?,
      includeTax: (json['includeTax'] as List<dynamic>?)
          ?.map((e) => TaxModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TreatmentMenuResponseToJson(
        TreatmentMenuResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospitalId': instance.hospitalId,
      'project': instance.project,
      'treatmentCostExcludingTax': instance.treatmentCostExcludingTax,
      'treatmentCostIncludingTax': instance.treatmentCostIncludingTax,
      'remark': instance.remark,
      'includeTax': instance.includeTax,
    };

TaxModel _$TaxModelFromJson(Map<String, dynamic> json) => TaxModel(
      tax: json['tax'] as num?,
      taxRate: json['taxRate'] as num?,
    );

Map<String, dynamic> _$TaxModelToJson(TaxModel instance) => <String, dynamic>{
      'tax': instance.tax,
      'taxRate': instance.taxRate,
    };
