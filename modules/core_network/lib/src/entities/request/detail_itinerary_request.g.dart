// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailItineraryRequest _$DetailItineraryRequestFromJson(
        Map<String, dynamic> json) =>
    DetailItineraryRequest(
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

Map<String, dynamic> _$DetailItineraryRequestToJson(
        DetailItineraryRequest instance) =>
    <String, dynamic>{
      'patientNames': instance.patientNames,
      'tourName': instance.tourName,
      'numberOfPeople': instance.numberOfPeople,
      'groupType': instance.groupType,
      'days': instance.days,
    };

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      patientName: json['patientName'] as String?,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
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
      meal: json['meal'] as String?,
      placeName: json['placeName'] as String?,
      accommodation: json['accommodation'] as String?,
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'date': instance.date,
      'meal': instance.meal,
      'placeName': instance.placeName,
      'accommodation': instance.accommodation,
      'group': instance.group,
    };
