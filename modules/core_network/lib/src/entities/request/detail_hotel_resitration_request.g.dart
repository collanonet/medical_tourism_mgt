// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_hotel_resitration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetainHotelRegistationRequest _$DetainHotelRegistationRequestFromJson(
        Map<String, dynamic> json) =>
    DetainHotelRegistationRequest(
      name: json['name'] as String,
      location: json['location'] as String,
      personInChargeName: json['personInChargeName'] as String,
      telephoneNumber: json['telephoneNumber'] as String,
      oneNightPrice: json['oneNightPrice'] as String,
      accommodationMemo: json['accommodationMemo'] as String,
      foreignLanguageStaff: json['foreignLanguageStaff'] as String,
      evaluation: json['evaluation'] as String,
    );

Map<String, dynamic> _$DetainHotelRegistationRequestToJson(
        DetainHotelRegistationRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'personInChargeName': instance.personInChargeName,
      'telephoneNumber': instance.telephoneNumber,
      'oneNightPrice': instance.oneNightPrice,
      'accommodationMemo': instance.accommodationMemo,
      'foreignLanguageStaff': instance.foreignLanguageStaff,
      'evaluation': instance.evaluation,
    };
