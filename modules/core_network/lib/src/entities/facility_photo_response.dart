// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'facility_photo_response.g.dart';
@JsonSerializable()
class FacilityResponse {
   @JsonKey(name: '_id')
  String id;
  String? facilityFile;
  String? nameOfHospital;
  String? photograph;
  DateTime? shootingDate;
  String? share;
  String? uploadedPhoto;

  FacilityResponse({
    required this.id,
    this.facilityFile,
    this.nameOfHospital,
    this.photograph,
    this.shootingDate,
    this.share,
    this.uploadedPhoto,
  });
  factory FacilityResponse.fromJson(Map<String, dynamic> json) =>
  _$FacilityResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FacilityResponseToJson(this);
}
