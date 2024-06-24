// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_related_parties_driver_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRelatedPartiesDriverRequest _$DetailRelatedPartiesDriverRequestFromJson(
        Map<String, dynamic> json) =>
    DetailRelatedPartiesDriverRequest(
      dateFrom: json['dateFrom'] as String?,
      dateTo: json['dateTo'] as String?,
      carNumber: json['carNumber'] as String?,
      carModel: json['carModel'] as String?,
      driverNameKanji: json['driverNameKanji'] as String?,
      driverNameKana: json['driverNameKana'] as String?,
      telephoneNumber1: json['telephoneNumber1'] as String?,
      supportedLanguage: json['supportedLanguage'] as String?,
      accommodationPossible: json['accommodationPossible'] as String?,
      hotelArrangement: json['hotelArrangement'] as String?,
      nameOfFacility: json['nameOfFacility'] as String?,
      location: json['location'] as String?,
      telephoneNumber2: json['telephoneNumber2'] as String?,
    );

Map<String, dynamic> _$DetailRelatedPartiesDriverRequestToJson(
        DetailRelatedPartiesDriverRequest instance) =>
    <String, dynamic>{
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'carNumber': instance.carNumber,
      'carModel': instance.carModel,
      'driverNameKanji': instance.driverNameKanji,
      'driverNameKana': instance.driverNameKana,
      'telephoneNumber1': instance.telephoneNumber1,
      'supportedLanguage': instance.supportedLanguage,
      'accommodationPossible': instance.accommodationPossible,
      'hotelArrangement': instance.hotelArrangement,
      'nameOfFacility': instance.nameOfFacility,
      'location': instance.location,
      'telephoneNumber2': instance.telephoneNumber2,
    };
