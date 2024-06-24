
import 'package:json_annotation/json_annotation.dart';
part 'detail_inerary_day.g.dart';

@JsonSerializable()
class DayList {
  List<Day>? days;

  DayList({this.days});
  
  factory DayList.fromJson(Map<String,dynamic> json){
    return _$DayListFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DayListToJson(this);
  }

}


@JsonSerializable()
class Day {
  String? date;
  String? meal;
  String? placeName;
  String? accommodation;
  GroupList? groupList;

  Day({
    this.date = '',
    this.meal = '',
    this.placeName = '',
    this.accommodation = '',
    this.groupList,
  });

  factory Day.fromJson(Map<String,dynamic> json){
    return _$DayFromJson(json);
  }
  Map<String,dynamic> toJson(){
    return _$DayToJson(this);
  }
}

@JsonSerializable()
class GroupList {
  List<Group>? groups;
  GroupList({this.groups});

  factory GroupList.fromJson(Map<String,dynamic> json){
    return _$GroupListFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$GroupListToJson(this);
  }
}

@JsonSerializable()
class Group {
  TaskList? taskList;

  Group({this.taskList});

  factory Group.fromJson(Map<String,dynamic> json){
    return _$GroupFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$GroupToJson(this);
  }
}


@JsonSerializable()
class TaskList {
  List<Task>? tasks;

  TaskList({this.tasks});

  factory TaskList.fromJson(Map<String,dynamic> json){
    return _$TaskListFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$TaskListToJson(this);
  }
}

@JsonSerializable()
class Task {
  String placeName;
  String timeFrom;
  String timeTo;
  String traffic;
  String itinerary;

  Task({
    this.placeName = '',
    this.timeFrom = '',
    this.timeTo = '',
    this.traffic = '',
    this.itinerary = '',
  });

  factory Task.fromJson(Map<String,dynamic> json){
    return _$TaskFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$TaskToJson(this);
  }

}







