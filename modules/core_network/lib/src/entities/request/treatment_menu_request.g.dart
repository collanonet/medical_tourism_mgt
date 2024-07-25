// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_menu_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentMenuRequest _$TreatmentMenuRequestFromJson(
        Map<String, dynamic> json) =>
    TreatmentMenuRequest(
      hospitalId: json['hospitalId'] as String?,
      project: json['project'] as String?,
      treatmentCostExcludingTax: json['treatmentCostExcludingTax'] as num?,
      treatmentCostIncludingTax: json['treatmentCostIncludingTax'] as num?,
      remark: json['remark'] as String?,
      includeTax: (json['includeTax'] as List<dynamic>?)
          ?.map((e) => TaxModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TreatmentMenuRequestToJson(
        TreatmentMenuRequest instance) =>
    <String, dynamic>{
      'hospitalId': instance.hospitalId,
      'project': instance.project,
      'treatmentCostExcludingTax': instance.treatmentCostExcludingTax,
      'treatmentCostIncludingTax': instance.treatmentCostIncludingTax,
      'remark': instance.remark,
      'includeTax': instance.includeTax,
    };
