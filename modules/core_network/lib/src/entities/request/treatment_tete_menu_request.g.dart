// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_tete_menu_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentTeleMenuRequest _$TreatmentTeleMenuRequestFromJson(
        Map<String, dynamic> json) =>
    TreatmentTeleMenuRequest(
      project: json['project'] as String?,
      treatmentCostExcludingTax: json['treatmentCostExcludingTax'] as num?,
      treatmentCostIncludingTax: json['treatmentCostIncludingTax'] as num?,
      remark: json['remark'] as String?,
      hospital: json['hospital'] as String?,
    );

Map<String, dynamic> _$TreatmentTeleMenuRequestToJson(
        TreatmentTeleMenuRequest instance) =>
    <String, dynamic>{
      'project': instance.project,
      'treatmentCostExcludingTax': instance.treatmentCostExcludingTax,
      'treatmentCostIncludingTax': instance.treatmentCostIncludingTax,
      'remark': instance.remark,
      'hospital': instance.hospital,
    };
