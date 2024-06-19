import 'package:json_annotation/json_annotation.dart';
part 'detail_facility_hotel_response.g.dart';
@JsonSerializable()
class DetailFacilityHotelResponse {
  @JsonKey(name: '_id')
  final String id;
  String? personInChargeOfArrangements;
  String? nameOfFacility;
  String? location;
  String? personInChargeName;
  String? telephoneNumber;
  String? remarks;
  String? foreignLanguageStaff;

  DetailFacilityHotelResponse({
    required this.id,
     this.personInChargeOfArrangements,
     this.nameOfFacility,
     this.location,
     this.personInChargeName,
     this.telephoneNumber,
     this.remarks,
     this.foreignLanguageStaff,
  });

  factory DetailFacilityHotelResponse.fromJson(Map<String,dynamic> json){
    return _$DetailFacilityHotelResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailFacilityHotelResponseToJson(this);
  }
}
