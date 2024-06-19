import 'package:json_annotation/json_annotation.dart';

part 'detail_facility_drop_in_facility_request.g.dart';

@JsonSerializable()
class DetailDropInFacilityRequest {
  String personInChargeOfArrangements;
  List<Facility> facilities;

  DetailDropInFacilityRequest({
    required this.personInChargeOfArrangements,
    required this.facilities,
  });

  factory DetailDropInFacilityRequest.fromJson(Map<String,dynamic> json){
    return _$DetailDropInFacilityRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailDropInFacilityRequestToJson(this);
  }

}

@JsonSerializable()
class Facility {
  String name;
  String location;
  String personInChargeName;
  String telephoneNumber;

  Facility({
    required this.name,
    required this.location,
    required this.personInChargeName,
    required this.telephoneNumber,
  });

  factory Facility.fromJson(Map<String,dynamic> json){
    return _$FacilityFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$FacilityToJson(this);
  }
}