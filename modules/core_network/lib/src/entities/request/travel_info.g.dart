// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelInfoRequest _$TravelInfoRequestFromJson(Map<String, dynamic> json) =>
    TravelInfoRequest(
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
      departureIn: json['departureIn'] as String?,
      arrivalIn: json['arrivalIn'] as String?,
      flightNumberIn: json['flightNumberIn'] as String?,
      departureTimeIn: json['departureTimeIn'] as String?,
      arrivalTimeIn: json['arrivalTimeIn'] as String?,
      departureOut: json['departureOut'] as String?,
      arrivalOut: json['arrivalOut'] as String?,
      flightNumberOut: json['flightNumberOut'] as String?,
      departureTimeOut: json['departureTimeOut'] as String?,
      arrivalTimeOut: json['arrivalTimeOut'] as String?,
      seatNumberOut: json['seatNumberOut'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$TravelInfoRequestToJson(TravelInfoRequest instance) =>
    <String, dynamic>{
      'landingPermissionDate':
          instance.landingPermissionDate?.toIso8601String(),
      'visaValidityPeriodExpirationDate':
          instance.visaValidityPeriodExpirationDate?.toIso8601String(),
      'dateOfEntryIntoJapan': instance.dateOfEntryIntoJapan?.toIso8601String(),
      'departureDateFromJapan':
          instance.departureDateFromJapan?.toIso8601String(),
      'departureIn': instance.departureIn,
      'arrivalIn': instance.arrivalIn,
      'flightNumberIn': instance.flightNumberIn,
      'departureTimeIn': instance.departureTimeIn,
      'arrivalTimeIn': instance.arrivalTimeIn,
      'departureOut': instance.departureOut,
      'arrivalOut': instance.arrivalOut,
      'flightNumberOut': instance.flightNumberOut,
      'departureTimeOut': instance.departureTimeOut,
      'arrivalTimeOut': instance.arrivalTimeOut,
      'seatNumberOut': instance.seatNumberOut,
      'remarks': instance.remarks,
    };
