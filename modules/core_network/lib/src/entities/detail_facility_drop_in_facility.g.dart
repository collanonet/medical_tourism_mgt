// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_facility_drop_in_facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailFacilityResponse _$DetailFacilityResponseFromJson(
        Map<String, dynamic> json) =>
    DetailFacilityResponse(
      id: json['_id'] as String,
      accommodationName: json['accommodationName'] as String?,
      address: json['address'] as String?,
      contctPersonName: json['contctPersonName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$DetailFacilityResponseToJson(
        DetailFacilityResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'accommodationName': instance.accommodationName,
      'address': instance.address,
      'contctPersonName': instance.contctPersonName,
      'phoneNumber': instance.phoneNumber,
    };
