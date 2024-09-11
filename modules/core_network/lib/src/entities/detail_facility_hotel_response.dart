// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_facility_hotel_response.g.dart';
@JsonSerializable()
class DetailFacilityHotelResponse {
  @JsonKey(name: '_id')
  final String id;
  String? arrangePerson;
  String? accommodationName;
  String? address;
  String? contactPersonName;
  String? phoneNumber;
  String? remarks;
  List<String>? foreignLanguageStaff;
  bool? others;
  String? tour;

  DetailFacilityHotelResponse({
    required this.id,
     this.arrangePerson,
     this.accommodationName,
     this.address,
     this.contactPersonName,
     this.phoneNumber,
     this.remarks,
     this.foreignLanguageStaff,
     this.others,
      this.tour,
  });

  factory DetailFacilityHotelResponse.fromJson(Map<String,dynamic> json){
    return _$DetailFacilityHotelResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailFacilityHotelResponseToJson(this);
  }
}
