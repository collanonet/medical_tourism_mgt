// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      placeName: json['placeName'] as String?,
      timeFrom: json['timeFrom'] as String?,
      timeTo: json['timeTo'] as String?,
      transportation: json['transportation'] as String?,
      itinerary: json['itinerary'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'placeName': instance.placeName,
      'timeFrom': instance.timeFrom,
      'timeTo': instance.timeTo,
      'transportation': instance.transportation,
      'itinerary': instance.itinerary,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      task: (json['task'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'task': instance.task,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      meals: (json['meals'] as List<dynamic>?)?.map((e) => e as bool).toList(),
      placeName: json['placeName'] as String?,
      accommodation: json['accommodation'] as String?,
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'meals': instance.meals,
      'placeName': instance.placeName,
      'accommodation': instance.accommodation,
      'groups': instance.groups,
    };
