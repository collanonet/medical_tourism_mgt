// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_qa_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchQARequest _$SearchQARequestFromJson(Map<String, dynamic> json) =>
    SearchQARequest(
      classification: json['classification'] as String?,
      enterKeyword: json['enterKeyword'] as String?,
    );

Map<String, dynamic> _$SearchQARequestToJson(SearchQARequest instance) =>
    <String, dynamic>{
      'classification': instance.classification,
      'enterKeyword': instance.enterKeyword,
    };
