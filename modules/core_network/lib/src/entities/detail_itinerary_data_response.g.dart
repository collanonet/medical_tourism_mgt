// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryPatient _$ItineraryPatientFromJson(Map<String, dynamic> json) =>
    ItineraryPatient(
      patientName: json['patientName'] as String?,
    );

Map<String, dynamic> _$ItineraryPatientToJson(ItineraryPatient instance) =>
    <String, dynamic>{
      'patientName': instance.patientName,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      placeName: json['placeName'] as String?,
      timeFrom: json['timeFrom'] as String?,
      timeTo: json['timeTo'] as String?,
      traffic: json['traffic'] as String?,
      itinerary: json['itinerary'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'placeName': instance.placeName,
      'timeFrom': instance.timeFrom,
      'timeTo': instance.timeTo,
      'traffic': instance.traffic,
      'itinerary': instance.itinerary,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'tasks': instance.tasks,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      date: json['date'] as String?,
      morning: json['morning'] as bool?,
      noon: json['noon'] as bool?,
      evening: json['evening'] as bool?,
      placeName: json['placeName'] as String?,
      accommodation: json['accommodation'] as String?,
      group: (json['group'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'date': instance.date,
      'morning': instance.morning,
      'noon': instance.noon,
      'evening': instance.evening,
      'placeName': instance.placeName,
      'accommodation': instance.accommodation,
      'group': instance.group,
    };
