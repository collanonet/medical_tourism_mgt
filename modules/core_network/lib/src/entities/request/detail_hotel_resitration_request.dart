import 'package:json_annotation/json_annotation.dart';
part 'detail_hotel_resitration_request.g.dart';

@JsonSerializable()
class DetainHotelRegistationRequest {
  String name;
  String location;
  String personInChargeName;
  String telephoneNumber;
  String oneNightPrice;
  String accommodationMemo;
  String foreignLanguageStaff;
  String evaluation;

  DetainHotelRegistationRequest({
    required this.name,
    required this.location,
    required this.personInChargeName,
    required this.telephoneNumber,
    required this.oneNightPrice,
    required this.accommodationMemo,
    required this.foreignLanguageStaff,
    required this.evaluation,
  });

  factory DetainHotelRegistationRequest.fromJson(Map<String,dynamic> json){
    return _$DetainHotelRegistationRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetainHotelRegistationRequestToJson(this);
  }

}