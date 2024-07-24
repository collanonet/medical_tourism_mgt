// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_tete_menu_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentTeleMenuRequest _$TreatmentTeleMenuRequestFromJson(
        Map<String, dynamic> json) =>
    TreatmentTeleMenuRequest(
      project: json['project'] as String?,
      treatingCostExcludingTax: json['treatingCostExcludingTax'] as num?,
      treatingCostIncludingTax: json['treatingCostIncludingTax'] as num?,
      remarks: json['remarks'] as String?,
      hospitalId: json['hospitalId'] as String?,
    );

Map<String, dynamic> _$TreatmentTeleMenuRequestToJson(
        TreatmentTeleMenuRequest instance) =>
    <String, dynamic>{
      'project': instance.project,
      'treatingCostExcludingTax': instance.treatingCostExcludingTax,
      'treatingCostIncludingTax': instance.treatingCostIncludingTax,
      'remarks': instance.remarks,
      'hospitalId': instance.hospitalId,
    };
