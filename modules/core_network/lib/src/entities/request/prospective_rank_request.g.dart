// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prospective_rank_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProspectiveRankRequest _$ProspectiveRankRequestFromJson(
        Map<String, dynamic> json) =>
    ProspectiveRankRequest(
      prospectRank: json['prospectRank'] as String?,
      shouldItBeIncludedInSalesManagementEstimates:
          json['shouldItBeIncludedInSalesManagementEstimates'] as bool?,
    );

Map<String, dynamic> _$ProspectiveRankRequestToJson(
        ProspectiveRankRequest instance) =>
    <String, dynamic>{
      'prospectRank': instance.prospectRank,
      'shouldItBeIncludedInSalesManagementEstimates':
          instance.shouldItBeIncludedInSalesManagementEstimates,
    };
