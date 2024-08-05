// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_facility_drop_in_facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Facility _$FacilityFromJson(Map<String, dynamic> json) => Facility(
      name: json['name'] as String?,
      location: json['location'] as String?,
      personInChargeName: json['personInChargeName'] as String?,
      telephoneNumber: json['telephoneNumber'] as String?,
    );

Map<String, dynamic> _$FacilityToJson(Facility instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'personInChargeName': instance.personInChargeName,
      'telephoneNumber': instance.telephoneNumber,
    };
