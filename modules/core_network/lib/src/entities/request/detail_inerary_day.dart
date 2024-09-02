// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_inerary_day.g.dart';

@JsonSerializable()
class Day {
  DateTime? date;
  List<bool>? meals;
  String? placeName;
  String? placeStay;
  List<Group?>? groups;

  Day({
    this.date,
    this.placeName,
    this.placeStay,
    this.groups,
    this.meals,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return _$DayFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DayToJson(this);
  }
}


@JsonSerializable()
class Group {
  List<Task?>? tasks;

  Group({this.tasks});

  factory Group.fromJson(Map<String, dynamic> json) {
    return _$GroupFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GroupToJson(this);
  }
}

@JsonSerializable()
class Task {
  String? placeName;
  String? timeFrom;
  String? timeTo;
  String? transportation;
  String? itinerary;

  Task({
    this.placeName,
    this.timeFrom,
    this.timeTo,
    this.transportation,
    this.itinerary,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return _$TaskFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TaskToJson(this);
  }
}
