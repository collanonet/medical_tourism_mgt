// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_facility_drop_in_facility.g.dart';
@JsonSerializable()
class DetailFacilityResponse {
   @JsonKey(name: '_id')
  final String id;
  String? accommodationName;
  String? address;
  String? contctPersonName;
  String? phoneNumber;

  DetailFacilityResponse({
    required this.id,
     this.accommodationName,
     this.address,
     this.contctPersonName,
     this.phoneNumber,
  });

  factory DetailFacilityResponse.fromJson(Map<String,dynamic> json){
    return _$DetailFacilityResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailFacilityResponseToJson(this);
  }

}
