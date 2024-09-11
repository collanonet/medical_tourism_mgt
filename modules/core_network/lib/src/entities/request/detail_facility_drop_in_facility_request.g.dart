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
      tour: json['tour'] as String?,
    );

Map<String, dynamic> _$DetailDropInFacilityRequestToJson(
        DetailDropInFacilityRequest instance) =>
    <String, dynamic>{
      'arrangePerson': instance.arrangePerson,
      'places': instance.places,
      'tour': instance.tour,
    };

Facility _$FacilityFromJson(Map<String, dynamic> json) => Facility(
      id: json['id'] as String?,
      accommodationName: json['accommodationName'] as String?,
      address: json['address'] as String?,
      contctPersonName: json['contctPersonName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      tour: json['tour'] as String,
    );

Map<String, dynamic> _$FacilityToJson(Facility instance) => <String, dynamic>{
      'id': instance.id,
      'accommodationName': instance.accommodationName,
      'address': instance.address,
      'contctPersonName': instance.contctPersonName,
      'phoneNumber': instance.phoneNumber,
      'tour': instance.tour,
    };
