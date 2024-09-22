import 'package:json_annotation/json_annotation.dart';
part 'necessary_in_japan_travel_info.g.dart';
@JsonSerializable()
class TravelInfo {
  DateTime? landingPermissionDate;
  DateTime? visaValidityPeriodExpirationDate;
  DateTime? dateOfEntryIntoJapan;
  DateTime? departureDateFromJapan;

  TravelInfo({
    this.landingPermissionDate,
    this.visaValidityPeriodExpirationDate,
    this.dateOfEntryIntoJapan,
    this.departureDateFromJapan,
  });

  factory TravelInfo.fromJson(Map<String, dynamic> json) => _$TravelInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TravelInfoToJson(this);
}