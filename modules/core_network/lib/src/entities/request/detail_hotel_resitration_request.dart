// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_hotel_resitration_request.g.dart';

@JsonSerializable()
class DetainHotelRegistationRequest {
  String? accommodationName;
  List<String>? accommodationType;
  String? area;
  String? address;
  String? contactPersonName;
  String? phoneNumber;
  double? ratePerNight;
  String? accommodationMemo;
  bool? isJapanese;
  bool? isChinese;
  bool? isVietnamese;
  bool? isEnglish;
  bool? isOthers;
  String? other;
  int? evaluation;
  String? memo;

  DetainHotelRegistationRequest({
    this.accommodationName,
    this.accommodationType,
    this.area,
    this.address,
    this.contactPersonName,
    this.phoneNumber,
    this.ratePerNight,
    this.accommodationMemo,
    this.isJapanese,
    this.isChinese,
    this.isVietnamese,
    this.isEnglish,
    this.isOthers,
    this.other,
    this.evaluation,
    this.memo,
  });

  factory DetainHotelRegistationRequest.fromJson(Map<String, dynamic> json) {
    return _$DetainHotelRegistationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DetainHotelRegistationRequestToJson(this);
  }
}
