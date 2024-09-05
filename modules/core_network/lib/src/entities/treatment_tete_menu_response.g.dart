// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_tete_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentTeleMenuResponse _$TreatmentTeleMenuResponseFromJson(
        Map<String, dynamic> json) =>
    TreatmentTeleMenuResponse(
      id: json['_id'] as String,
      project: json['project'] as String?,
      treatmentCostExcludingTax:
          (json['treatmentCostExcludingTax'] as num?)?.toDouble(),
      treatmentCostTaxIncluded:
          (json['treatmentCostTaxIncluded'] as num?)?.toDouble(),
      remark: json['remark'] as String?,
      hospital: json['hospital'] as String?,
    );

Map<String, dynamic> _$TreatmentTeleMenuResponseToJson(
        TreatmentTeleMenuResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'project': instance.project,
      'treatmentCostExcludingTax': instance.treatmentCostExcludingTax,
      'treatmentCostTaxIncluded': instance.treatmentCostTaxIncluded,
      'remark': instance.remark,
      'hospital': instance.hospital,
    };
