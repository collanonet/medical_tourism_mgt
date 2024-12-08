// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prospective_rank_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProspectiveRankResponse _$ProspectiveRankResponseFromJson(
        Map<String, dynamic> json) =>
    ProspectiveRankResponse(
      id: json['_id'] as String,
      prospectRank: json['prospectRank'] as String?,
      shouldItBeIncludedInSalesManagementEstimates:
          json['shouldItBeIncludedInSalesManagementEstimates'] as bool?,
    );

Map<String, dynamic> _$ProspectiveRankResponseToJson(
        ProspectiveRankResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'prospectRank': instance.prospectRank,
      'shouldItBeIncludedInSalesManagementEstimates':
          instance.shouldItBeIncludedInSalesManagementEstimates,
    };
