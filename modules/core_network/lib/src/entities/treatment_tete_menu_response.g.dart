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
      treatingCostExcludingTax: json['treatingCostExcludingTax'] as num?,
      treatingCostIncludingTax: json['treatingCostIncludingTax'] as num?,
      remarks: json['remarks'] as String?,
      hospitalId: json['hospitalId'] as String?,
    );

Map<String, dynamic> _$TreatmentTeleMenuResponseToJson(
        TreatmentTeleMenuResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'project': instance.project,
      'treatingCostExcludingTax': instance.treatingCostExcludingTax,
      'treatingCostIncludingTax': instance.treatingCostIncludingTax,
      'remarks': instance.remarks,
      'hospitalId': instance.hospitalId,
    };
