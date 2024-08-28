// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_itinerary_simple_pick_up_request.g.dart';
@JsonSerializable()
class DetailItinerarySimplePickUpAndDropOffRequest {
  bool? pickUpAndDropOffCheck;
  DateTime? pickUpDateAndTime;
  String? time;
  String? place;
  bool? type;
  String? arranger;
  String? carNumber;
  String? driverNameKanli;
  String? driverNameKana;
  String? phone;

  DetailItinerarySimplePickUpAndDropOffRequest({
    this.pickUpAndDropOffCheck,
    this.pickUpDateAndTime,
    this.time,
    this.place,
    this.type,
    this.arranger,
    this.carNumber,
    this.driverNameKanli,
    this.driverNameKana,
    this.phone,
  });

  factory DetailItinerarySimplePickUpAndDropOffRequest.fromJson(Map<String,dynamic> json){
    return _$DetailItinerarySimplePickUpAndDropOffRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailItinerarySimplePickUpAndDropOffRequestToJson(this);
  }

}
