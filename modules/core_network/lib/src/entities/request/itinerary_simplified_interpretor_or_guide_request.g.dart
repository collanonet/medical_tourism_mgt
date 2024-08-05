// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_interpretor_or_guide_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryInterpreterOrGuideInputRequest
    _$ItineraryInterpreterOrGuideInputRequestFromJson(
            Map<String, dynamic> json) =>
        ItineraryInterpreterOrGuideInputRequest(
          interpreterOrGuide: json['interpreterOrGuide'] as String?,
          date: json['date'] as String?,
          time: json['time'] as String?,
          meetingPlace: json['meetingPlace'] as String?,
        );

Map<String, dynamic> _$ItineraryInterpreterOrGuideInputRequestToJson(
        ItineraryInterpreterOrGuideInputRequest instance) =>
    <String, dynamic>{
      'interpreterOrGuide': instance.interpreterOrGuide,
      'date': instance.date,
      'time': instance.time,
      'meetingPlace': instance.meetingPlace,
    };
