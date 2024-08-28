// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailItineraryResponse _$DetailItineraryResponseFromJson(
        Map<String, dynamic> json) =>
    DetailItineraryResponse(
      id: json['_id'] as String?,
      patient:
          (json['patient'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tourName: json['tourName'] as String?,
      peopleNumber: (json['peopleNumber'] as num?)?.toInt(),
      classification: json['classification'] as String?,
      group: (json['group'] as num?)?.toInt(),
      day: (json['day'] as List<dynamic>?)
          ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailItineraryResponseToJson(
        DetailItineraryResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'patient': instance.patient,
      'tourName': instance.tourName,
      'peopleNumber': instance.peopleNumber,
      'group': instance.group,
      'classification': instance.classification,
      'day': instance.day,
    };
