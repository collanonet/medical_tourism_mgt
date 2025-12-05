// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_title_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryTitleResponse _$ItineraryTitleResponseFromJson(
        Map<String, dynamic> json) {
  final titleData = json['title'] as Map<String, dynamic>? ?? json;
  return ItineraryTitleResponse(
    id: json['_id'] as String,
    patientName: titleData['patientName'] as String?,
    medicalInstitutionName: titleData['medicalInstitutionName'] as String?,
    consultationDateAndTime: titleData['consultationDateAndTime'] as String?,
    startTime: titleData['startTime'] as String?,
    endingTimePlanned: titleData['endingTimePlanned'] as String?,
    healthCheckupPackage: titleData['healthCheckupPackage'] as String?,
    addOptions: (titleData['addOptions'] as List<dynamic>?)
        ?.map((e) => AddOption.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

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
