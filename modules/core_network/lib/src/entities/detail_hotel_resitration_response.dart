import 'package:json_annotation/json_annotation.dart';
part 'detail_hotel_resitration_response.g.dart';

@JsonSerializable()
class DetainHotelRegistationResponse {
  @JsonKey(name: '_id')
  final String? id;
  String? accommodationName;
  String? address;
  String? contactPersonName;
  String? phoneNumber;
  String? ratePerNight;
  String? accommodationMemo;
  String? foreignLanguageStaff;
  String? evaluation;
   bool? japanese;
  bool? chinese;
  bool? vietnamese;
  bool? english;
  bool? others;

  DetainHotelRegistationResponse({
    required this.id,
     this.accommodationName,
     this.address,
     this.contactPersonName,
     this.phoneNumber,
     this.ratePerNight,
     this.accommodationMemo,
     this.foreignLanguageStaff,
     this.evaluation,
     this.japanese,
     this.chinese,
     this.vietnamese,
     this.english,
     this.others
  });

  factory DetainHotelRegistationResponse.fromJson(Map<String,dynamic> json){
    return _$DetainHotelRegistationResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetainHotelRegistationResponseToJson(this);
  }
}