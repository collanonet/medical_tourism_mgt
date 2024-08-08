// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_hotel_resitration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetainHotelRegistationRequest _$DetainHotelRegistationRequestFromJson(
        Map<String, dynamic> json) =>
    DetainHotelRegistationRequest(
      accommodationName: json['accommodationName'] as String?,
      address: json['address'] as String?,
      contactPersonName: json['contactPersonName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      ratePerNight: json['ratePerNight'] as String?,
      accommodationMemo: json['accommodationMemo'] as String?,
      foreignLanguageStaff: json['foreignLanguageStaff'] as String?,
      evaluation: json['evaluation'] as String?,
      japanese: json['japanese'] as bool?,
      chinese: json['chinese'] as bool?,
      vietnamese: json['vietnamese'] as bool?,
      english: json['english'] as bool?,
      other: json['other'] as bool?,
    );

Map<String, dynamic> _$DetainHotelRegistationRequestToJson(
        DetainHotelRegistationRequest instance) =>
    <String, dynamic>{
      'accommodationName': instance.accommodationName,
      'address': instance.address,
      'contactPersonName': instance.contactPersonName,
      'phoneNumber': instance.phoneNumber,
      'ratePerNight': instance.ratePerNight,
      'accommodationMemo': instance.accommodationMemo,
      'foreignLanguageStaff': instance.foreignLanguageStaff,
      'evaluation': instance.evaluation,
      'japanese': instance.japanese,
      'chinese': instance.chinese,
      'vietnamese': instance.vietnamese,
      'english': instance.english,
      'other': instance.other,
    };
