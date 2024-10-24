// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleRequest _$ScheduleRequestFromJson(Map<String, dynamic> json) =>
    ScheduleRequest(
      treatmentSchedule: json['treatmentSchedule'] == null
          ? null
          : DateTime.parse(json['treatmentSchedule'] as String),
      treatmentScheduleFileSelect:
          json['treatmentScheduleFileSelect'] as String?,
    );

Map<String, dynamic> _$ScheduleRequestToJson(ScheduleRequest instance) =>
    <String, dynamic>{
      'treatmentSchedule': instance.treatmentSchedule?.toIso8601String(),
      'treatmentScheduleFileSelect': instance.treatmentScheduleFileSelect,
    };
