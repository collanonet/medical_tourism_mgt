// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_inerary_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      date: json['date'] as String? ?? '',
      morning: json['morning'] as bool?,
      noon: json['noon'] as bool?,
      evening: json['evening'] as bool?,
      placeName: json['placeName'] as String? ?? '',
      accommodation: json['accommodation'] as String? ?? '',
      groups: json['groups'] == null
          ? null
          : GroupList.fromJson(json['groups'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'date': instance.date,
      'morning': instance.morning,
      'noon': instance.noon,
      'evening': instance.evening,
      'placeName': instance.placeName,
      'accommodation': instance.accommodation,
      'groups': instance.groups,
    };

GroupList _$GroupListFromJson(Map<String, dynamic> json) => GroupList(
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupListToJson(GroupList instance) => <String, dynamic>{
      'groups': instance.groups,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      task: json['task'] == null
          ? null
          : TaskList.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'task': instance.task,
    };

TaskList _$TaskListFromJson(Map<String, dynamic> json) => TaskList(
      task: (json['task'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskListToJson(TaskList instance) => <String, dynamic>{
      'task': instance.task,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      placeName: json['placeName'] as String? ?? '',
      timeFrom: json['timeFrom'] as String? ?? '',
      timeTo: json['timeTo'] as String? ?? '',
      transportation: json['transportation'] as String? ?? '',
      itinerary: json['itinerary'] as String? ?? '',
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'placeName': instance.placeName,
      'timeFrom': instance.timeFrom,
      'timeTo': instance.timeTo,
      'transportation': instance.transportation,
      'itinerary': instance.itinerary,
    };
