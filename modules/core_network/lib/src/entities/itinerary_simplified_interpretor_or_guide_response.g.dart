// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_interpretor_or_guide_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryInterpreterOrGuideInputResponse
    _$ItineraryInterpreterOrGuideInputResponseFromJson(
            Map<String, dynamic> json) =>
        ItineraryInterpreterOrGuideInputResponse(
          id: json['_id'] as String,
          interpreterOrGuide: json['interpreterOrGuide'] as String?,
          date: json['date'] as String?,
          time: json['time'] as String?,
          meetingPlace: json['meetingPlace'] as String?,
        );

Map<String, dynamic> _$ItineraryInterpreterOrGuideInputResponseToJson(
        ItineraryInterpreterOrGuideInputResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'interpreterOrGuide': instance.interpreterOrGuide,
      'date': instance.date,
      'time': instance.time,
      'meetingPlace': instance.meetingPlace,
    };
