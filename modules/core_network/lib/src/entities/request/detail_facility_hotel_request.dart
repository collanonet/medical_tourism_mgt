import 'package:json_annotation/json_annotation.dart';
part 'detail_facility_hotel_request.g.dart';
@JsonSerializable()
class DetailFacilityHotelRequest {
  String? personInChargeOfArrangements;
  String? nameOfFacility;
  String? location;
  String? personInChargeName;
  String? telephoneNumber;
  String? remarks;
  String? foreignLanguageStaff;
  bool? japanese;
  bool? chinese;
  bool? vietnamese;
  bool? english;
  bool? others;

  DetailFacilityHotelRequest({
     this.personInChargeOfArrangements,
     this.nameOfFacility,
     this.location,
     this.personInChargeName,
     this.telephoneNumber,
     this.remarks,
     this.foreignLanguageStaff,
     this.japanese,
     this.chinese,
     this.vietnamese,
     this.english,
     this.others
  });

  factory DetailFacilityHotelRequest.fromJson(Map<String,dynamic> json){
    return _$DetailFacilityHotelRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailFacilityHotelRequestToJson(this);
  }

}
