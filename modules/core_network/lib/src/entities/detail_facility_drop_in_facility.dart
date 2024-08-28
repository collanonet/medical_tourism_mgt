// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_facility_drop_in_facility.g.dart';
@JsonSerializable()
class Facility {
  String? name;
  String? location;
  String? personInChargeName;
  String? telephoneNumber;

  Facility({
     this.name,
     this.location,
     this.personInChargeName,
     this.telephoneNumber,
  });

  factory Facility.fromJson(Map<String,dynamic> json){
    return _$FacilityFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$FacilityToJson(this);
  }

}
