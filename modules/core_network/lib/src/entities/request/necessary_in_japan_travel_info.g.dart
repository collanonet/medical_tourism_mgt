// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'necessary_in_japan_travel_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelInfo _$TravelInfoFromJson(Map<String, dynamic> json) => TravelInfo(
      landingPermissionDate: json['landingPermissionDate'] == null
          ? null
          : DateTime.parse(json['landingPermissionDate'] as String),
      visaValidityPeriodExpirationDate:
          json['visaValidityPeriodExpirationDate'] == null
              ? null
              : DateTime.parse(
                  json['visaValidityPeriodExpirationDate'] as String),
      dateOfEntryIntoJapan: json['dateOfEntryIntoJapan'] == null
          ? null
          : DateTime.parse(json['dateOfEntryIntoJapan'] as String),
      departureDateFromJapan: json['departureDateFromJapan'] == null
          ? null
          : DateTime.parse(json['departureDateFromJapan'] as String),
    );

Map<String, dynamic> _$TravelInfoToJson(TravelInfo instance) =>
    <String, dynamic>{
      'landingPermissionDate':
          instance.landingPermissionDate?.toIso8601String(),
      'visaValidityPeriodExpirationDate':
          instance.visaValidityPeriodExpirationDate?.toIso8601String(),
      'dateOfEntryIntoJapan': instance.dateOfEntryIntoJapan?.toIso8601String(),
      'departureDateFromJapan':
          instance.departureDateFromJapan?.toIso8601String(),
    };
