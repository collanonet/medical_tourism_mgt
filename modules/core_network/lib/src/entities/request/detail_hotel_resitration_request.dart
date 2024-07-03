import 'package:json_annotation/json_annotation.dart';
part 'detail_hotel_resitration_request.g.dart';

@JsonSerializable()
class DetainHotelRegistationRequest {
  String? name;
  String? location;
  String? personInChargeName;
  String? telephoneNumber;
  String? oneNightPrice;
  String? accommodationMemo;
  String? foreignLanguageStaff;
  String? evaluation;
  bool? japanese;
  bool? chinese;
  bool? vietnamese;
  bool? english;
  bool? other;

  DetainHotelRegistationRequest({
    this.name,
    this.location,
    this.personInChargeName,
    this.telephoneNumber,
    this.oneNightPrice,
    this.accommodationMemo,
    this.foreignLanguageStaff,
    this.evaluation,
    this.japanese,
    this.chinese,
    this.vietnamese,
    this.english,
    this.other,
  });

  factory DetainHotelRegistationRequest.fromJson(Map<String, dynamic> json) {
    return _$DetainHotelRegistationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DetainHotelRegistationRequestToJson(this);
  }
}
