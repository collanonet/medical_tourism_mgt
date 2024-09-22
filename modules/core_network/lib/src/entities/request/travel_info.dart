import 'package:json_annotation/json_annotation.dart';
part 'travel_info.g.dart';

@JsonSerializable()
class TravelInfo {
  DateTime? landingPermissionDate;
  DateTime? visaValidityPeriodExpirationDate;
  DateTime? dateOfEntryIntoJapan;
  DateTime? departureDateFromJapan;
  String? departureIn;
  String? arrivalIn;
  String? flightNumberIn;
  String? departureTimeIn;
  String? arrivalTimeIn;
  String? departureOut;
  String? arrivalOut;
  String? flightNumberOut;
  String? departureTimeOut;
  String? arrivalTimeOut;
  String? seatNumberOut;
  String? remarks;

  TravelInfo({
    this.landingPermissionDate,
    this.visaValidityPeriodExpirationDate,
    this.dateOfEntryIntoJapan,
    this.departureDateFromJapan,
    this.departureIn,
    this.arrivalIn,
    this.flightNumberIn,
    this.departureTimeIn,
    this.arrivalTimeIn,
    this.departureOut,
    this.arrivalOut,
    this.flightNumberOut,
    this.departureTimeOut,
    this.arrivalTimeOut,
    this.seatNumberOut,
    this.remarks,
  });

  factory TravelInfo.fromJson(Map<String, dynamic> json) => _$TravelInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TravelInfoToJson(this);
}