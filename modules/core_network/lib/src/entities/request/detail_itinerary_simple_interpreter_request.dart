import 'package:json_annotation/json_annotation.dart';
part 'detail_itinerary_simple_interpreter_request.g.dart';
@JsonSerializable()
class DetailItinerarySimpleInterpreterOrGuideRequest {
  bool? interpreterOrGuide;
  DateTime? date;
  String? time;
  String? meetingPoint;

  DetailItinerarySimpleInterpreterOrGuideRequest({
    this.interpreterOrGuide,
    this.date,
    this.time,
    this.meetingPoint,
  });

  factory DetailItinerarySimpleInterpreterOrGuideRequest.fromJson(Map<String,dynamic> json){
    return _$DetailItinerarySimpleInterpreterOrGuideRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailItinerarySimpleInterpreterOrGuideRequestToJson(this);
  }

}