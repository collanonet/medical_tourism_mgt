// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_menu_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentMenuRequest _$TreatmentMenuRequestFromJson(
        Map<String, dynamic> json) =>
    TreatmentMenuRequest(
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

Map<String, dynamic> _$TreatmentMenuRequestToJson(
        TreatmentMenuRequest instance) =>
    <String, dynamic>{
      'hospital': instance.hospital,
      'project': instance.project,
      'treatmentCostExcludingTax': instance.treatmentCostExcludingTax,
      'treatmentCostTaxIncluded': instance.treatmentCostTaxIncluded,
      'remark': instance.remark,
      'treatmentCostTax': instance.treatmentCostTax,
    };
