// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_hotel_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailHotelSearchResponse _$DetailHotelSearchResponseFromJson(
        Map<String, dynamic> json) =>
    DetailHotelSearchResponse(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      usageRecord: json['usageRecord'] as String?,
      area: json['area'] as String?,
      supportedLanguage: json['supportedLanguage'] as String?,
    );

Map<String, dynamic> _$DetailHotelSearchResponseToJson(
        DetailHotelSearchResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'usageRecord': instance.usageRecord,
      'area': instance.area,
      'supportedLanguage': instance.supportedLanguage,
    };
