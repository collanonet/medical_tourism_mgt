// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'itinerary_simplified_transfer_input_request.g.dart';

@JsonSerializable()
class ItineraryTransferInputRequest {
  String? transfer;
  String? date;
  String? time;
  String? place;
  String? driverInCharge;
  String? patientId;

  ItineraryTransferInputRequest({
     this.transfer,
     this.date,
     this.time,
     this.place,
     this.driverInCharge,
     this.patientId,
  });

  factory ItineraryTransferInputRequest.fromJson(Map<String,dynamic> json){
    return _$ItineraryTransferInputRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$ItineraryTransferInputRequestToJson(this);
  }
 
}
