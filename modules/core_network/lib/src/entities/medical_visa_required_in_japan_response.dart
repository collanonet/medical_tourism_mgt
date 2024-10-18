
import 'package:json_annotation/json_annotation.dart';
part 'medical_visa_required_in_japan_response.g.dart';

@JsonSerializable()
class MedicalVisaRequiredInJapanResponse {
    @JsonKey(name: '_id')
  final String id;
  List<VisaInfo>? visaInfo;
  List<Schedule>? schedule;
  DateTime? statementOfReasonsDate;
  DateTime? travelCompanionListDate;
  List<TravelInfo>? travelInfo;

  MedicalVisaRequiredInJapanResponse({
    required this.id,
    this.visaInfo,
    this.schedule,
    this.statementOfReasonsDate,
    this.travelCompanionListDate,
    this.travelInfo,
  });

  factory MedicalVisaRequiredInJapanResponse.fromJson(Map<String, dynamic> json) => _$MedicalVisaRequiredInJapanResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalVisaRequiredInJapanResponseToJson(this);

}

@JsonSerializable()
class VisaInfo {
    @JsonKey(name: '_id')
  final String id;
  DateTime? passportDate;
  String? passportFileSelect;
  DateTime? letterOfGuaranteeDate;
  String? letterOfGuaranteeFileSelect;
  String? sendBy;
  bool? byEMS;
  bool? byFedex;
  bool? byothers;

  VisaInfo({
    required this.id,
    this.passportDate,
    this.passportFileSelect,
    this.letterOfGuaranteeFileSelect,
    this.letterOfGuaranteeDate,
    this.sendBy,
    this.byEMS,
    this.byFedex,
    this.byothers,
  });

  factory VisaInfo.fromJson(Map<String, dynamic> json) => _$VisaInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VisaInfoToJson(this);
}

@JsonSerializable()
class Schedule {
    @JsonKey(name: '_id')
  final String id;
  DateTime? treatmentSchedule;

  Schedule({
    required this.id,
    this.treatmentSchedule,});

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

@JsonSerializable()
class TravelInfo {
    @JsonKey(name: '_id')
  final String id;
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
    required this.id,
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