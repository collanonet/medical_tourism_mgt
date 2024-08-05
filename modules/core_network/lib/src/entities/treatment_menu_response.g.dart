// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentMenuResponse _$TreatmentMenuResponseFromJson(
        Map<String, dynamic> json) =>
    TreatmentMenuResponse(
      id: json['_id'] as String,
      hospital: json['hospital'] as String?,
      project: json['project'] as String?,
      treatmentCostExcludingTax:
          (json['treatmentCostExcludingTax'] as num?)?.toDouble(),
      treatmentCostTaxIncluded:
          (json['treatmentCostTaxIncluded'] as num?)?.toDouble(),
      remark: json['remark'] as String?,
      treatmentCostTax: (json['treatmentCostTax'] as List<dynamic>?)
          ?.map((e) => TaxModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TreatmentMenuResponseToJson(
        TreatmentMenuResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospital': instance.hospital,
      'project': instance.project,
      'treatmentCostExcludingTax': instance.treatmentCostExcludingTax,
      'treatmentCostTaxIncluded': instance.treatmentCostTaxIncluded,
      'remark': instance.remark,
      'treatmentCostTax': instance.treatmentCostTax,
    };

TaxModel _$TaxModelFromJson(Map<String, dynamic> json) => TaxModel(
      cost: (json['cost'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TaxModelToJson(TaxModel instance) => <String, dynamic>{
      'cost': instance.cost,
      'tax': instance.tax,
    };
