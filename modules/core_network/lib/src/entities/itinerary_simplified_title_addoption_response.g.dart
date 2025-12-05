// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_title_addoption_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOption _$AddOptionFromJson(Map<String, dynamic> json) => AddOption(
      optionName: json['option_name'] as String?,
      medicalExaminationDay: json['medical_examination_day'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$AddOptionToJson(AddOption instance) => <String, dynamic>{
      'option_name': instance.optionName,
      'medical_examination_day': instance.medicalExaminationDay,
      'date': instance.date,
      'time': instance.time,
    };
