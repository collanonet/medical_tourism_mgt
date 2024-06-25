// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_simple_interpreter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailItinerarySimpleInterpreterOrGuideRequest
    _$DetailItinerarySimpleInterpreterOrGuideRequestFromJson(
            Map<String, dynamic> json) =>
        DetailItinerarySimpleInterpreterOrGuideRequest(
          interpreterOrGuide: json['interpreterOrGuide'] as bool?,
          date: json['date'] == null
              ? null
              : DateTime.parse(json['date'] as String),
          time: json['time'] as String?,
          meetingPoint: json['meetingPoint'] as String?,
        );

Map<String, dynamic> _$DetailItinerarySimpleInterpreterOrGuideRequestToJson(
        DetailItinerarySimpleInterpreterOrGuideRequest instance) =>
    <String, dynamic>{
      'interpreterOrGuide': instance.interpreterOrGuide,
      'date': instance.date?.toIso8601String(),
      'time': instance.time,
      'meetingPoint': instance.meetingPoint,
    };
