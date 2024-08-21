// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_hotel_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailHotelSearchResponse _$DetailHotelSearchResponseFromJson(
        Map<String, dynamic> json) =>
    DetailHotelSearchResponse(
      id: json['_id'] as String?,
      accommodationName: json['accommodationName'] as String?,
      accommodationType: json['accommodationType'] as String?,
      usageRecord: json['usageRecord'] as String?,
      area: json['area'] as String?,
      supportedLanguage: json['supportedLanguage'] as String?,
      hotel: json['hotel'] as bool?,
      apartmentHotel: json['apartmentHotel'] as bool?,
      usageHistory: json['usageHistory'] as String?,
      japanese: json['japanese'] as bool?,
      chinese: json['chinese'] as bool?,
      vietnamese: json['vietnamese'] as bool?,
      english: json['english'] as bool?,
      korean: json['korean'] as bool?,
      thai: json['thai'] as bool?,
    );

Map<String, dynamic> _$DetailHotelSearchResponseToJson(
        DetailHotelSearchResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'accommodationName': instance.accommodationName,
      'accommodationType': instance.accommodationType,
      'usageRecord': instance.usageRecord,
      'area': instance.area,
      'supportedLanguage': instance.supportedLanguage,
      'hotel': instance.hotel,
      'apartmentHotel': instance.apartmentHotel,
      'usageHistory': instance.usageHistory,
      'japanese': instance.japanese,
      'chinese': instance.chinese,
      'vietnamese': instance.vietnamese,
      'english': instance.english,
      'korean': instance.korean,
      'thai': instance.thai,
    };
