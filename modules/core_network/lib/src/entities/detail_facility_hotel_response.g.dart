// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_facility_hotel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailFacilityHotelResponse _$DetailFacilityHotelResponseFromJson(
        Map<String, dynamic> json) =>
    DetailFacilityHotelResponse(
      id: json['_id'] as String,
      arrangePerson: json['arrangePerson'] as String?,
      accommodationName: json['accommodationName'] as String?,
      address: json['address'] as String?,
      contactPersonName: json['contactPersonName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      remarks: json['remarks'] as String?,
      foreignLanguageStaff: (json['foreignLanguageStaff'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      others: json['others'] as bool?,
    )
      ..japanese = json['japanese'] as bool?
      ..chinese = json['chinese'] as bool?
      ..vietnamese = json['vietnamese'] as bool?
      ..english = json['english'] as bool?;

Map<String, dynamic> _$DetailFacilityHotelResponseToJson(
        DetailFacilityHotelResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'arrangePerson': instance.arrangePerson,
      'accommodationName': instance.accommodationName,
      'address': instance.address,
      'contactPersonName': instance.contactPersonName,
      'phoneNumber': instance.phoneNumber,
      'remarks': instance.remarks,
      'foreignLanguageStaff': instance.foreignLanguageStaff,
      'japanese': instance.japanese,
      'chinese': instance.chinese,
      'vietnamese': instance.vietnamese,
      'english': instance.english,
      'others': instance.others,
    };
