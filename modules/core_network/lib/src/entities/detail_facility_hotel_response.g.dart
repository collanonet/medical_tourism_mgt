// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_facility_hotel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailFacilityHotelResponse _$DetailFacilityHotelResponseFromJson(
        Map<String, dynamic> json) =>
    DetailFacilityHotelResponse(
      id: json['_id'] as String,
      personInChargeOfArrangements:
          json['personInChargeOfArrangements'] as String?,
      nameOfFacility: json['nameOfFacility'] as String?,
      location: json['location'] as String?,
      personInChargeName: json['personInChargeName'] as String?,
      telephoneNumber: json['telephoneNumber'] as String?,
      remarks: json['remarks'] as String?,
      foreignLanguageStaff: json['foreignLanguageStaff'] as String?,
    );

Map<String, dynamic> _$DetailFacilityHotelResponseToJson(
        DetailFacilityHotelResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'personInChargeOfArrangements': instance.personInChargeOfArrangements,
      'nameOfFacility': instance.nameOfFacility,
      'location': instance.location,
      'personInChargeName': instance.personInChargeName,
      'telephoneNumber': instance.telephoneNumber,
      'remarks': instance.remarks,
      'foreignLanguageStaff': instance.foreignLanguageStaff,
    };
