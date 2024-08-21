// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_related_parties_driver_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRelatedPartiesDriverRequest _$DetailRelatedPartiesDriverRequestFromJson(
        Map<String, dynamic> json) =>
    DetailRelatedPartiesDriverRequest(
      dateYearFrom: json['dateYearFrom'] == null
          ? null
          : DateTime.parse(json['dateYearFrom'] as String),
      dateYearTo: json['dateYearTo'] == null
          ? null
          : DateTime.parse(json['dateYearTo'] as String),
      carNumber: json['carNumber'] as String?,
      vehicleType: json['vehicleType'] as String?,
      driverNamaKanji: json['driverNamaKanji'] as String?,
      driverNameKana: json['driverNameKana'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      language: (json['language'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      accommodationAvailability: json['accommodationAvailability'] as String?,
      hotelArrangement: json['hotelArrangement'] as String?,
      accommodationName: json['accommodationName'] as String?,
      address: json['address'] as String?,
      phoneNumber2: json['phoneNumber2'] as String?,
    );

Map<String, dynamic> _$DetailRelatedPartiesDriverRequestToJson(
        DetailRelatedPartiesDriverRequest instance) =>
    <String, dynamic>{
      'dateYearFrom': instance.dateYearFrom?.toIso8601String(),
      'dateYearTo': instance.dateYearTo?.toIso8601String(),
      'carNumber': instance.carNumber,
      'vehicleType': instance.vehicleType,
      'driverNamaKanji': instance.driverNamaKanji,
      'driverNameKana': instance.driverNameKana,
      'phoneNumber': instance.phoneNumber,
      'language': instance.language,
      'accommodationAvailability': instance.accommodationAvailability,
      'hotelArrangement': instance.hotelArrangement,
      'accommodationName': instance.accommodationName,
      'address': instance.address,
      'phoneNumber2': instance.phoneNumber2,
    };
