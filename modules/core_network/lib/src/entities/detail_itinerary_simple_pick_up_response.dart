import 'package:json_annotation/json_annotation.dart';
part 'detail_itinerary_simple_pick_up_response.g.dart';
@JsonSerializable()
class DetailItinerarySimplePickUpAndDropOffResponse {
   @JsonKey(name: '_id')
  final String? id;
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

  DetailItinerarySimplePickUpAndDropOffResponse({
    required this.id,
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

  factory DetailItinerarySimplePickUpAndDropOffResponse.fromJson(Map<String,dynamic> json){
    return _$DetailItinerarySimplePickUpAndDropOffResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailItinerarySimplePickUpAndDropOffResponseToJson(this);
  }

}