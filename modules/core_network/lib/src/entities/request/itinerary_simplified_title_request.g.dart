// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_title_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryTitleRequest _$ItineraryTitleRequestFromJson(
        Map<String, dynamic> json) =>
    ItineraryTitleRequest(
      patientName: json['patientName'] as String?,
      medicalInstitutionName: json['medicalInstitutionName'] as String?,
      consultationDateAndTime: json['consultationDateAndTime'] as String?,
      startTime: json['startTime'] as String?,
      endingTimePlanned: json['endingTimePlanned'] as String?,
      healthCheckupPackage: json['healthCheckupPackage'] as String?,
      addOptions: (json['addOptions'] as List<dynamic>?)
          ?.map((e) => AddOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItineraryTitleRequestToJson(
        ItineraryTitleRequest instance) =>
    <String, dynamic>{
      'patientName': instance.patientName,
      'medicalInstitutionName': instance.medicalInstitutionName,
      'consultationDateAndTime': instance.consultationDateAndTime,
      'startTime': instance.startTime,
      'endingTimePlanned': instance.endingTimePlanned,
      'healthCheckupPackage': instance.healthCheckupPackage,
      'addOptions': instance.addOptions,
    };

AddOption _$AddOptionFromJson(Map<String, dynamic> json) => AddOption(
      optionName: json['optionName'] as String?,
      medicalExaminationDay: json['medicalExaminationDay'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$AddOptionToJson(AddOption instance) => <String, dynamic>{
      'optionName': instance.optionName,
      'medicalExaminationDay': instance.medicalExaminationDay,
      'date': instance.date,
      'time': instance.time,
    };
