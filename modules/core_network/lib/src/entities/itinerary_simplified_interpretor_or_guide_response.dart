import 'package:json_annotation/json_annotation.dart';
part 'itinerary_simplified_interpretor_or_guide_response.g.dart';
@JsonSerializable()
class ItineraryInterpreterOrGuideInputResponse {
  @JsonKey(name: '_id')
  final String id;
  String? interpreterOrGuide;
  String? date;
  String? time;
  String? meetingPlace;

  ItineraryInterpreterOrGuideInputResponse({
    required this.id,
     this.interpreterOrGuide,
     this.date,
     this.time,
     this.meetingPlace,
  });

  factory ItineraryInterpreterOrGuideInputResponse.fromJson(Map<String,dynamic> json){
    return _$ItineraryInterpreterOrGuideInputResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$ItineraryInterpreterOrGuideInputResponseToJson(this);
  }
}