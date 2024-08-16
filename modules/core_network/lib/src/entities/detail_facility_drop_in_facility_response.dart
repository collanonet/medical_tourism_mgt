import 'package:json_annotation/json_annotation.dart';

import 'request/detail_facility_drop_in_facility_request.dart';
part 'detail_facility_drop_in_facility_response.g.dart';
@JsonSerializable()
class DetailDropInFacilityResponse {
  @JsonKey(name: '_id')
  final String id;
  String? arrangePerson;
  List<Facility>? places;

  DetailDropInFacilityResponse({
    required this.id,
     this.arrangePerson,
     this.places,
  });

  factory DetailDropInFacilityResponse.fromJson(Map<String,dynamic> json){
    return _$DetailDropInFacilityResponseFromJson(json);
  }
  Map<String,dynamic> toJson(){
    return _$DetailDropInFacilityResponseToJson(this);
  }

}

