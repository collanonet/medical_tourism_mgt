import 'package:json_annotation/json_annotation.dart';
part 'facility_photo_request.g.dart';
@JsonSerializable()
class FacilityRequest {
  String? facilityFile;
  String? nameOfHospital;
  String? photograph;
  DateTime? shootingDate;
  String? share;
  String? uploadedPhoto;
  String hospitalRecord;

  FacilityRequest({
    this.facilityFile,
    this.nameOfHospital,
    this.photograph,
    this.shootingDate,
    this.share,
    this.uploadedPhoto,
    required this.hospitalRecord,
  });

  factory FacilityRequest.fromJson(Map<String, dynamic> json) => _$FacilityRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FacilityRequestToJson(this);
}