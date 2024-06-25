// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_simple_version_title_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailItinerarySimpleTitleRequest _$DetailItinerarySimpleTitleRequestFromJson(
        Map<String, dynamic> json) =>
    DetailItinerarySimpleTitleRequest(
      patientName: json['patientName'] as String?,
      nameOfMedicalInstitution: json['nameOfMedicalInstitution'] as String?,
      dateAndTimeConsultaion: json['dateAndTimeConsultaion'] == null
          ? null
          : DateTime.parse(json['dateAndTimeConsultaion'] as String),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      healthCheckPackage: json['healthCheckPackage'] as String?,
      optionName: json['optionName'] as String?,
      checkupDate: json['checkupDate'] as bool?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      time: json['time'] as String?,
    );

Map<String, dynamic> _$DetailItinerarySimpleTitleRequestToJson(
        DetailItinerarySimpleTitleRequest instance) =>
    <String, dynamic>{
      'patientName': instance.patientName,
      'nameOfMedicalInstitution': instance.nameOfMedicalInstitution,
      'dateAndTimeConsultaion':
          instance.dateAndTimeConsultaion?.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'healthCheckPackage': instance.healthCheckPackage,
      'optionName': instance.optionName,
      'checkupDate': instance.checkupDate,
      'date': instance.date?.toIso8601String(),
      'time': instance.time,
    };
