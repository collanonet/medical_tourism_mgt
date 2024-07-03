// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_inerary_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayList _$DayListFromJson(Map<String, dynamic> json) => DayList(
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayListToJson(DayList instance) => <String, dynamic>{
      'days': instance.days,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      date: json['date'] as String? ?? '',
      morning: json['morning'] as bool?,
      noon: json['noon'] as bool?,
      evening: json['evening'] as bool?,
      placeName: json['placeName'] as String? ?? '',
      accommodation: json['accommodation'] as String? ?? '',
      groupList: json['groupList'] == null
          ? null
          : GroupList.fromJson(json['groupList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'date': instance.date,
      'morning': instance.morning,
      'noon': instance.noon,
      'evening': instance.evening,
      'placeName': instance.placeName,
      'accommodation': instance.accommodation,
      'groupList': instance.groupList,
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
      taskList: json['taskList'] == null
          ? null
          : TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'taskList': instance.taskList,
    };

TaskList _$TaskListFromJson(Map<String, dynamic> json) => TaskList(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskListToJson(TaskList instance) => <String, dynamic>{
      'tasks': instance.tasks,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      placeName: json['placeName'] as String? ?? '',
      timeFrom: json['timeFrom'] as String? ?? '',
      timeTo: json['timeTo'] as String? ?? '',
      traffic: json['traffic'] as String? ?? '',
      itinerary: json['itinerary'] as String? ?? '',
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'placeName': instance.placeName,
      'timeFrom': instance.timeFrom,
      'timeTo': instance.timeTo,
      'traffic': instance.traffic,
      'itinerary': instance.itinerary,
    };
