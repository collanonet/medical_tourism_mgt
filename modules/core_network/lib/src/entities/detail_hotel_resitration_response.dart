// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_hotel_resitration_response.g.dart';

@JsonSerializable()
class DetainHotelRegistationResponse {
  @JsonKey(name: '_id')
  final String? id;
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


  DetainHotelRegistationResponse({
    required this.id,
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

  factory DetainHotelRegistationResponse.fromJson(Map<String,dynamic> json){
    return _$DetainHotelRegistationResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetainHotelRegistationResponseToJson(this);
  }
}
