// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_facility_drop_in_facility_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailDropInFacilityResponse _$DetailDropInFacilityResponseFromJson(
        Map<String, dynamic> json) =>
    DetailDropInFacilityResponse(
      id: json['_id'] as String,
      personInChargeOfArrangements:
          json['personInChargeOfArrangements'] as String?,
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailDropInFacilityResponseToJson(
        DetailDropInFacilityResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'personInChargeOfArrangements': instance.personInChargeOfArrangements,
      'facilities': instance.facilities,
    };
