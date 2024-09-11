// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_facility_hotel_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailFacilityHotelRequest _$DetailFacilityHotelRequestFromJson(
        Map<String, dynamic> json) =>
    DetailFacilityHotelRequest(
      arrangePerson: json['arrangePerson'] as String?,
      accommodationName: json['accommodationName'] as String?,
      address: json['address'] as String?,
      contactPersonName: json['contactPersonName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      remarks: json['remarks'] as String?,
      foreignLanguageStaff: (json['foreignLanguageStaff'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      other: json['other'] as String?,
      hotel: json['hotel'] as String?,
      tour: json['tour'] as String?,
    );

Map<String, dynamic> _$DetailFacilityHotelRequestToJson(
        DetailFacilityHotelRequest instance) =>
    <String, dynamic>{
      'arrangePerson': instance.arrangePerson,
      'accommodationName': instance.accommodationName,
      'address': instance.address,
      'contactPersonName': instance.contactPersonName,
      'phoneNumber': instance.phoneNumber,
      'remarks': instance.remarks,
      'foreignLanguageStaff': instance.foreignLanguageStaff,
      'other': instance.other,
      'hotel': instance.hotel,
      'tour': instance.tour,
    };
