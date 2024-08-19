import 'package:json_annotation/json_annotation.dart';
part 'detail_facility_hotel_request.g.dart';
@JsonSerializable()
class DetailFacilityHotelRequest {
  String? arrangePerson;
  String? accommodationName;
  String? address;
  String? contactPersonName;
  String? phoneNumber;
  String? remarks;
  List<String>? foreignLanguageStaff;
  String? other;
  String? hotel;

  DetailFacilityHotelRequest({
     this.arrangePerson,
     this.accommodationName,
     this.address,
     this.contactPersonName,
     this.phoneNumber,
     this.remarks,
     this.foreignLanguageStaff,
     this.other,
     this.hotel,
  });

  factory DetailFacilityHotelRequest.fromJson(Map<String,dynamic> json){
    return _$DetailFacilityHotelRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailFacilityHotelRequestToJson(this);
  }

}
