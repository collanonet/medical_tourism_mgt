// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'itinerary_simplified_interpretor_or_guide_request.g.dart';
@JsonSerializable()
class ItineraryInterpreterOrGuideInputRequest {
  String? interpreterOrGuide;
  String? date;
  String? time;
  String? meetingPlace;

  ItineraryInterpreterOrGuideInputRequest({
     this.interpreterOrGuide,
     this.date,
     this.time,
     this.meetingPlace,
  });

  factory ItineraryInterpreterOrGuideInputRequest.fromJson(Map<String,dynamic> json){
    return _$ItineraryInterpreterOrGuideInputRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$ItineraryInterpreterOrGuideInputRequestToJson(this);
  }

}
