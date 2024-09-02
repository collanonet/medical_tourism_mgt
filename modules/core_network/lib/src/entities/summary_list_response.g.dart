// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryListResponse _$SummaryListResponseFromJson(Map<String, dynamic> json) =>
    SummaryListResponse(
      id: json['_id'] as String,
      documentName: json['documentName'] as String?,
      dateOfIssue: json['dateOfIssue'] == null
          ? null
          : DateTime.parse(json['dateOfIssue'] as String),
      share: json['share'] as String?,
      disclosureToAgent: json['disclosureToAgent'] as bool?,
    );

Map<String, dynamic> _$SummaryListResponseToJson(
        SummaryListResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'documentName': instance.documentName,
      'dateOfIssue': instance.dateOfIssue?.toIso8601String(),
      'share': instance.share,
      'disclosureToAgent': instance.disclosureToAgent,
    };
