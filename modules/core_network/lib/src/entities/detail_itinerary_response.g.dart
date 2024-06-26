// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailItineraryResponse _$DetailItineraryResponseFromJson(
        Map<String, dynamic> json) =>
    DetailItineraryResponse(
      id: json['_id'] as String?,
      patientNames: (json['patientNames'] as List<dynamic>?)
          ?.map((e) => Patient.fromJson(e as Map<String, dynamic>))
          .toList(),
      tourName: json['tourName'] as String?,
      numberOfPeople: json['numberOfPeople'] as String?,
      groupType: json['groupType'] as String?,
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailItineraryResponseToJson(
        DetailItineraryResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'patientNames': instance.patientNames,
      'tourName': instance.tourName,
      'numberOfPeople': instance.numberOfPeople,
      'groupType': instance.groupType,
      'days': instance.days,
    };
