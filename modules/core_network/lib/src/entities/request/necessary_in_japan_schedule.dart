import 'package:json_annotation/json_annotation.dart';
part 'necessary_in_japan_schedule.g.dart';
@JsonSerializable()
class Schedule {
  DateTime? treatmentSchedule;

  Schedule({
    this.treatmentSchedule,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}