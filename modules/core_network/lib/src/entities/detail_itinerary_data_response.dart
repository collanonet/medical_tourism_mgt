// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_itinerary_data_response.g.dart';

// @JsonSerializable()
// class ItineraryPatient {
//   String? patientName;

//   ItineraryPatient({this.patientName});
//   factory ItineraryPatient.fromJson(Map<String,dynamic> json){
//     return _$ItineraryPatientFromJson(json);
//   }

//   Map<String,dynamic> toJson(){
//     return _$ItineraryPatientToJson(this);
//   }
// }

@JsonSerializable()
class Task {
   @JsonKey(name: '_id')
  final String? id;
  String? placeName;
  String? timeFrom;
  String? timeTo;
  String? transportation;
  String? itinerary;

  Task({
    this.id,
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

@JsonSerializable()
class Group {
  @JsonKey(name: '_id')
  final String? id;
  List<Task>? tasks;

  Group({
    this.tasks,
    this.id,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return _$GroupFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GroupToJson(this);
  }
}

@JsonSerializable()
class Day {
  @JsonKey(name: '_id')
  final String? id;
  DateTime? date;
  List<bool>? meals;
  String? placeName;
  String? placeStay;
  List<Group>? groups;

  Day({
    this.id,
    this.date,
    this.meals,
    this.placeName,
    this.placeStay,
    this.groups,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return _$DayFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DayToJson(this);
  }
}
