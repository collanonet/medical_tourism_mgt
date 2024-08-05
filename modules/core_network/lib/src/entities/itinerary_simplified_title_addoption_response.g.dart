// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_title_addoption_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOption _$AddOptionFromJson(Map<String, dynamic> json) => AddOption(
      optionName: json['optionName'] as String?,
      medicalExaminationDay: json['medicalExaminationDay'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$AddOptionToJson(AddOption instance) => <String, dynamic>{
      'optionName': instance.optionName,
      'medicalExaminationDay': instance.medicalExaminationDay,
      'date': instance.date,
      'time': instance.time,
    };
