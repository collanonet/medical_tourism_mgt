import 'package:json_annotation/json_annotation.dart';
part 'detail_itinerary_data_response.g.dart';

@JsonSerializable()
class ItineraryPatient {
  String? patientName;

  ItineraryPatient({this.patientName});
  factory ItineraryPatient.fromJson(Map<String,dynamic> json){
    return _$ItineraryPatientFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$ItineraryPatientToJson(this);
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

  factory Task.fromJson(Map<String,dynamic> json){
    return _$TaskFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$TaskToJson(this);
  }


}

@JsonSerializable()
class Group {
  List<Task>? task;

  Group({ this.task});
 
 factory Group.fromJson(Map<String,dynamic> json){
  return _$GroupFromJson(json);
 }

 Map<String,dynamic> toJson(){
  return _$GroupToJson(this);
 }

 
}

@JsonSerializable()
class Day {
  String? date;
List<bool>? meals;
  String? placeName;
  String? accommodation;
  List<Group>? groups;

  Day({
     this.date,
     this.meals,
     this.placeName,
     this.accommodation,
     this.groups,
  });

  factory Day.fromJson(Map<String,dynamic> json){
    return _$DayFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DayToJson(this);
  }
  
}

