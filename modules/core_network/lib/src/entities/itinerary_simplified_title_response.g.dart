// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_title_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryTitleResponse _$ItineraryTitleResponseFromJson(
        Map<String, dynamic> json) =>
    ItineraryTitleResponse(
      id: json['_id'] as String,
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

Map<String, dynamic> _$ItineraryTitleResponseToJson(
        ItineraryTitleResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'patientName': instance.patientName,
      'medicalInstitutionName': instance.medicalInstitutionName,
      'consultationDateAndTime': instance.consultationDateAndTime,
      'startTime': instance.startTime,
      'endingTimePlanned': instance.endingTimePlanned,
      'healthCheckupPackage': instance.healthCheckupPackage,
      'addOptions': instance.addOptions,
    };
