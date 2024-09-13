// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'detail_facility_drop_in_facility.dart';

part 'detail_facility_drop_in_facility_response.g.dart';
@JsonSerializable()
class DetailDropInFacilityResponse {
  @JsonKey(name: '_id')
  final String id;
  String? arrangePerson;
  List<DetailFacilityResponse>? places;

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

