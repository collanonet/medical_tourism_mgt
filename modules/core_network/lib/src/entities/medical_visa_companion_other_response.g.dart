// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_companion_other_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaCompanionOtherResponse _$MedicalVisaCompanionOtherResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaCompanionOtherResponse(
      id: json['_id'] as String,
      nameRomaji: json['nameRomaji'] as String?,
      dateBirth: json['dateBirth'] == null
          ? null
          : DateTime.parse(json['dateBirth'] as String),
      sex: json['sex'] as bool?,
      addressArea: json['addressArea'] as String?,
      numberPassport: json['numberPassport'] as String?,
      dateLandingPermit: json['dateLandingPermit'] == null
          ? null
          : DateTime.parse(json['dateLandingPermit'] as String),
      dateVisaExpiration: json['dateVisaExpiration'] == null
          ? null
          : DateTime.parse(json['dateVisaExpiration'] as String),
      dateEntryIntoJapan: json['dateEntryIntoJapan'] == null
          ? null
          : DateTime.parse(json['dateEntryIntoJapan'] as String),
      dateEntryFromJapan: json['dateEntryFromJapan'] == null
          ? null
          : DateTime.parse(json['dateEntryFromJapan'] as String),
      departureEntry: json['departureEntry'] as String?,
      arrivalEntry: json['arrivalEntry'] as String?,
      flightNumberEntry: json['flightNumberEntry'] as String?,
      departureTimeEntry: json['departureTimeEntry'] as String?,
      arrivalTimeEntry: json['arrivalTimeEntry'] as String?,
      departureDeparture: json['departureDeparture'] as String?,
      arrivalDeparture: json['arrivalDeparture'] as String?,
      flightNumberDeparture: json['flightNumberDeparture'] as String?,
      departureTimeDeparture: json['departureTimeDeparture'] as String?,
      arrivalTimeDeparture: json['arrivalTimeDeparture'] as String?,
      flightSeatNumberDeparturer: json['flightSeatNumberDeparturer'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$MedicalVisaCompanionOtherResponseToJson(
        MedicalVisaCompanionOtherResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nameRomaji': instance.nameRomaji,
      'dateBirth': instance.dateBirth?.toIso8601String(),
      'sex': instance.sex,
      'addressArea': instance.addressArea,
      'numberPassport': instance.numberPassport,
      'dateLandingPermit': instance.dateLandingPermit?.toIso8601String(),
      'dateVisaExpiration': instance.dateVisaExpiration?.toIso8601String(),
      'dateEntryIntoJapan': instance.dateEntryIntoJapan?.toIso8601String(),
      'dateEntryFromJapan': instance.dateEntryFromJapan?.toIso8601String(),
      'departureEntry': instance.departureEntry,
      'arrivalEntry': instance.arrivalEntry,
      'flightNumberEntry': instance.flightNumberEntry,
      'departureTimeEntry': instance.departureTimeEntry,
      'arrivalTimeEntry': instance.arrivalTimeEntry,
      'departureDeparture': instance.departureDeparture,
      'arrivalDeparture': instance.arrivalDeparture,
      'flightNumberDeparture': instance.flightNumberDeparture,
      'departureTimeDeparture': instance.departureTimeDeparture,
      'arrivalTimeDeparture': instance.arrivalTimeDeparture,
      'flightSeatNumberDeparturer': instance.flightSeatNumberDeparturer,
      'remarks': instance.remarks,
    };
