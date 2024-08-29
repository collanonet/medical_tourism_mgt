// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_itinerary_simple_interpreter_response.g.dart';
@JsonSerializable()
class DetailItinerarySimpleInterpreterOrGuideResponse {
    @JsonKey(name: '_id')
  final String? id;
  bool? interpreterOrGuide;
  DateTime? date;
  String? time;
  String? meetingPoint;

  DetailItinerarySimpleInterpreterOrGuideResponse({
    required this.id,
    this.interpreterOrGuide,
    this.date,
    this.time,
    this.meetingPoint,
  });
  factory DetailItinerarySimpleInterpreterOrGuideResponse.fromJson(Map<String,dynamic> json){
    return _$DetailItinerarySimpleInterpreterOrGuideResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailItinerarySimpleInterpreterOrGuideResponseToJson(this);
  }
}
