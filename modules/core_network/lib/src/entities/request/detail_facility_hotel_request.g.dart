// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_facility_hotel_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailFacilityHotelRequest _$DetailFacilityHotelRequestFromJson(
        Map<String, dynamic> json) =>
    DetailFacilityHotelRequest(
      personInChargeOfArrangements:
          json['personInChargeOfArrangements'] as String?,
      nameOfFacility: json['nameOfFacility'] as String?,
      location: json['location'] as String?,
      personInChargeName: json['personInChargeName'] as String?,
      telephoneNumber: json['telephoneNumber'] as String?,
      remarks: json['remarks'] as String?,
      foreignLanguageStaff: json['foreignLanguageStaff'] as String?,
      japanese: json['japanese'] as bool?,
      chinese: json['chinese'] as bool?,
      vietnamese: json['vietnamese'] as bool?,
      english: json['english'] as bool?,
      others: json['others'] as bool?,
    );

Map<String, dynamic> _$DetailFacilityHotelRequestToJson(
        DetailFacilityHotelRequest instance) =>
    <String, dynamic>{
      'personInChargeOfArrangements': instance.personInChargeOfArrangements,
      'nameOfFacility': instance.nameOfFacility,
      'location': instance.location,
      'personInChargeName': instance.personInChargeName,
      'telephoneNumber': instance.telephoneNumber,
      'remarks': instance.remarks,
      'foreignLanguageStaff': instance.foreignLanguageStaff,
      'japanese': instance.japanese,
      'chinese': instance.chinese,
      'vietnamese': instance.vietnamese,
      'english': instance.english,
      'others': instance.others,
    };
