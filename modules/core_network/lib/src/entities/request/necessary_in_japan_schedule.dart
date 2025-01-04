// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'necessary_in_japan_schedule.g.dart';
@JsonSerializable()
class ScheduleRequest{
  DateTime? treatmentSchedule;
  String? treatmentScheduleFileName;

  ScheduleRequest({
    this.treatmentSchedule,
    this.treatmentScheduleFileName,
  });

  factory ScheduleRequest.fromJson(Map<String, dynamic> json) => _$ScheduleRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleRequestToJson(this);
}
