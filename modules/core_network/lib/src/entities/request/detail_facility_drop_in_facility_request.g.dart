// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_facility_drop_in_facility_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailDropInFacilityRequest _$DetailDropInFacilityRequestFromJson(
        Map<String, dynamic> json) =>
    DetailDropInFacilityRequest(
      arrangePerson: json['arrangePerson'] as String?,
      places: (json['places'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailDropInFacilityRequestToJson(
        DetailDropInFacilityRequest instance) =>
    <String, dynamic>{
      'arrangePerson': instance.arrangePerson,
      'places': instance.places,
    };

Facility _$FacilityFromJson(Map<String, dynamic> json) => Facility(
      accommodationName: json['accommodationName'] as String?,
      address: json['address'] as String?,
      contctPersonName: json['contctPersonName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$FacilityToJson(Facility instance) => <String, dynamic>{
      'accommodationName': instance.accommodationName,
      'address': instance.address,
      'contctPersonName': instance.contctPersonName,
      'phoneNumber': instance.phoneNumber,
    };
