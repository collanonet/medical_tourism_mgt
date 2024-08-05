// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_hotel_resitration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetainHotelRegistationResponse _$DetainHotelRegistationResponseFromJson(
        Map<String, dynamic> json) =>
    DetainHotelRegistationResponse(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      personInChargeName: json['personInChargeName'] as String?,
      telephoneNumber: json['telephoneNumber'] as String?,
      oneNightPrice: json['oneNightPrice'] as String?,
      accommodationMemo: json['accommodationMemo'] as String?,
      foreignLanguageStaff: json['foreignLanguageStaff'] as String?,
      evaluation: json['evaluation'] as String?,
      japanese: json['japanese'] as bool?,
      chinese: json['chinese'] as bool?,
      vietnamese: json['vietnamese'] as bool?,
      english: json['english'] as bool?,
      others: json['others'] as bool?,
    );

Map<String, dynamic> _$DetainHotelRegistationResponseToJson(
        DetainHotelRegistationResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'personInChargeName': instance.personInChargeName,
      'telephoneNumber': instance.telephoneNumber,
      'oneNightPrice': instance.oneNightPrice,
      'accommodationMemo': instance.accommodationMemo,
      'foreignLanguageStaff': instance.foreignLanguageStaff,
      'evaluation': instance.evaluation,
      'japanese': instance.japanese,
      'chinese': instance.chinese,
      'vietnamese': instance.vietnamese,
      'english': instance.english,
      'others': instance.others,
    };
