// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_qa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchQAResponse _$SearchQAResponseFromJson(Map<String, dynamic> json) =>
    SearchQAResponse(
      id: json['_id'] as String,
      classification: json['classification'] as String?,
      enterKeyword: json['enterKeyword'] as String?,
    );

Map<String, dynamic> _$SearchQAResponseToJson(SearchQAResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'classification': instance.classification,
      'enterKeyword': instance.enterKeyword,
    };
