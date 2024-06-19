// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_facility_drop_in_facility_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailDropInFacilityRequest _$DetailDropInFacilityRequestFromJson(
        Map<String, dynamic> json) =>
    DetailDropInFacilityRequest(
      personInChargeOfArrangements:
          json['personInChargeOfArrangements'] as String,
      facilities: (json['facilities'] as List<dynamic>)
          .map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailDropInFacilityRequestToJson(
        DetailDropInFacilityRequest instance) =>
    <String, dynamic>{
      'personInChargeOfArrangements': instance.personInChargeOfArrangements,
      'facilities': instance.facilities,
    };

Facility _$FacilityFromJson(Map<String, dynamic> json) => Facility(
      name: json['name'] as String,
      location: json['location'] as String,
      personInChargeName: json['personInChargeName'] as String,
      telephoneNumber: json['telephoneNumber'] as String,
    );

Map<String, dynamic> _$FacilityToJson(Facility instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'personInChargeName': instance.personInChargeName,
      'telephoneNumber': instance.telephoneNumber,
    };
