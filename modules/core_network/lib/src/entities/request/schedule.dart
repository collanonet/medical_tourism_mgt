// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable()
class ScheduleRequest {
  DateTime? treatmentSchedule;
  String? treatmentScheduleFileSelect;

  ScheduleRequest({
    this.treatmentSchedule,
    this.treatmentScheduleFileSelect,
  });
  factory ScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$ScheduleRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleRequestToJson(this);
}
