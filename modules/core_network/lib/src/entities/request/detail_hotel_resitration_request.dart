import 'package:json_annotation/json_annotation.dart';
part 'detail_hotel_resitration_request.g.dart';

@JsonSerializable()
class DetainHotelRegistationRequest {
  String? accommodationName;
  String? address;
  String? contactPersonName;
  String? phoneNumber;
  String? ratePerNight;
  String? accommodationMemo;
  String? foreignLanguageStaff;
  String? evaluation;
  bool? japanese;
  bool? chinese;
  bool? vietnamese;
  bool? english;
  bool? other;

  DetainHotelRegistationRequest({
    this.accommodationName,
     this.address,
     this.contactPersonName,
     this.phoneNumber,
     this.ratePerNight,
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
