// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_simple_interpreter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailItinerarySimpleInterpreterOrGuideResponse
    _$DetailItinerarySimpleInterpreterOrGuideResponseFromJson(
            Map<String, dynamic> json) =>
        DetailItinerarySimpleInterpreterOrGuideResponse(
          id: json['_id'] as String?,
          interpreterOrGuide: json['interpreterOrGuide'] as bool?,
          date: json['date'] == null
              ? null
              : DateTime.parse(json['date'] as String),
          time: json['time'] as String?,
          meetingPoint: json['meetingPoint'] as String?,
        );

Map<String, dynamic> _$DetailItinerarySimpleInterpreterOrGuideResponseToJson(
        DetailItinerarySimpleInterpreterOrGuideResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'interpreterOrGuide': instance.interpreterOrGuide,
      'date': instance.date?.toIso8601String(),
      'time': instance.time,
      'meetingPoint': instance.meetingPoint,
    };
