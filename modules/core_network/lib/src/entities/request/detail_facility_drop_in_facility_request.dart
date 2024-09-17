// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_facility_drop_in_facility_request.g.dart';

@JsonSerializable()
class DetailDropInFacilityRequest {
  String? arrangePerson;
  List<Facility>? places;
  String? hotel;
  String? tour;

  DetailDropInFacilityRequest({
    this.arrangePerson,
    this.places,
    this.hotel,
    required this.tour,
  });

  factory DetailDropInFacilityRequest.fromJson(Map<String, dynamic> json) {
    return _$DetailDropInFacilityRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DetailDropInFacilityRequestToJson(this);
  }
}

@JsonSerializable()
class Facility {
  String? accommodationName;
  String? address;
  String? contctPersonName;
  String? phoneNumber;
  String tour;

  Facility({
    this.accommodationName,
    this.address,
    this.contctPersonName,
    this.phoneNumber,
    required this.tour,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return _$FacilityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FacilityToJson(this);
  }
}
