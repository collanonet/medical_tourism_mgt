// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_hotel_resitration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetainHotelRegistationRequest _$DetainHotelRegistationRequestFromJson(
        Map<String, dynamic> json) =>
    DetainHotelRegistationRequest(
      accommodationName: json['accommodationName'] as String?,
      accommodationType: (json['accommodationType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      area: json['area'] as String?,
      address: json['address'] as String?,
      contactPersonName: json['contactPersonName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      ratePerNight: (json['ratePerNight'] as num?)?.toDouble(),
      accommodationMemo: json['accommodationMemo'] as String?,
      isJapanese: json['isJapanese'] as bool?,
      isChinese: json['isChinese'] as bool?,
      isVietnamese: json['isVietnamese'] as bool?,
      isEnglish: json['isEnglish'] as bool?,
      isOthers: json['isOthers'] as bool?,
      other: json['other'] as String?,
      evaluation: (json['evaluation'] as num?)?.toInt(),
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$DetainHotelRegistationRequestToJson(
        DetainHotelRegistationRequest instance) =>
    <String, dynamic>{
      'accommodationName': instance.accommodationName,
      'accommodationType': instance.accommodationType,
      'area': instance.area,
      'address': instance.address,
      'contactPersonName': instance.contactPersonName,
      'phoneNumber': instance.phoneNumber,
      'ratePerNight': instance.ratePerNight,
      'accommodationMemo': instance.accommodationMemo,
      'isJapanese': instance.isJapanese,
      'isChinese': instance.isChinese,
      'isVietnamese': instance.isVietnamese,
      'isEnglish': instance.isEnglish,
      'isOthers': instance.isOthers,
      'other': instance.other,
      'evaluation': instance.evaluation,
      'memo': instance.memo,
    };
