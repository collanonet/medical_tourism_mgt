// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_hotel_search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailHotelSearchRequest _$DetailHotelSearchRequestFromJson(
        Map<String, dynamic> json) =>
    DetailHotelSearchRequest(
      name: json['name'] as String?,
      type: json['type'] as String?,
      usageRecord: json['usageRecord'] as String?,
      area: json['area'] as String?,
      supportedLanguage: json['supportedLanguage'] as String?,
    );

Map<String, dynamic> _$DetailHotelSearchRequestToJson(
        DetailHotelSearchRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'usageRecord': instance.usageRecord,
      'area': instance.area,
      'supportedLanguage': instance.supportedLanguage,
    };
