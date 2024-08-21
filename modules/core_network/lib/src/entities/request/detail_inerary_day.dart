import 'package:json_annotation/json_annotation.dart';
part 'detail_inerary_day.g.dart';

@JsonSerializable()
// class DayList {
//   List<Day>? day;

//   DayList({this.day});

//   factory DayList.fromJson(Map<String, dynamic> json) {
//     return _$DayListFromJson(json);
//   }

//   Map<String, dynamic> toJson() {
//     return _$DayListToJson(this);
//   }
// }

@JsonSerializable()
class Day {
  String? date;
  bool? morning;
  bool? noon;
  bool? evening;
  String? placeName;
  String? accommodation;
  GroupList? groups;

  Day({
    this.date = '',
    this.morning,
    this.noon,
    this.evening,
    this.placeName = '',
    this.accommodation = '',
    this.groups,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return _$DayFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DayToJson(this);
  }
}

@JsonSerializable()
class GroupList {
  List<Group>? groups;
  GroupList({this.groups});

  factory GroupList.fromJson(Map<String, dynamic> json) {
    return _$GroupListFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GroupListToJson(this);
  }
}

@JsonSerializable()
class Group {
  TaskList? task;

  Group({this.task});

  factory Group.fromJson(Map<String, dynamic> json) {
    return _$GroupFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GroupToJson(this);
  }
}

@JsonSerializable()
class TaskList {
  List<Task>? task;

  TaskList({this.task});

  factory TaskList.fromJson(Map<String, dynamic> json) {
    return _$TaskListFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TaskListToJson(this);
  }
}

@JsonSerializable()
class Task {
  String placeName;
  String timeFrom;
  String timeTo;
  String transportation;
  String itinerary;

  Task({
    this.placeName = '',
    this.timeFrom = '',
    this.timeTo = '',
    this.transportation = '',
    this.itinerary = '',
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return _$TaskFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TaskToJson(this);
  }
}
