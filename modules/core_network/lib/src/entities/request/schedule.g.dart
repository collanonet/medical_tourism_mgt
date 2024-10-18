// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      treatmentSchedule: json['treatmentSchedule'] == null
          ? null
          : DateTime.parse(json['treatmentSchedule'] as String),
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'treatmentSchedule': instance.treatmentSchedule?.toIso8601String(),
    };
