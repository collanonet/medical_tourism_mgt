// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'itinerary_simplified_transfer_input_response.g.dart';
@JsonSerializable()
class ItineraryTransferInputResponse {
   @JsonKey(name: '_id')
  final String id;
  String? transfer;
  String? date;
  String? time;
  String? place;
  String? driverInCharge;

  ItineraryTransferInputResponse({
    required this.id,
     this.transfer,
     this.date,
     this.time,
     this.place,
     this.driverInCharge,
  });

  factory ItineraryTransferInputResponse.fromJson(Map<String,dynamic> json){
    return _$ItineraryTransferInputResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$ItineraryTransferInputResponseToJson(this);
  }
}
