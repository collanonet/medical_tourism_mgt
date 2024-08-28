// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_itinerary_simple_version_title_request.g.dart';

@JsonSerializable()
class DetailItinerarySimpleTitleRequest {
  String? patientName;
  String? nameOfMedicalInstitution;
  DateTime? dateAndTimeConsultaion;
  String? startTime;
  String? endTime;
  String? healthCheckPackage;
  String? optionName;
  bool? checkupDate;
  DateTime? date;
  String? time;

  DetailItinerarySimpleTitleRequest({
    this.patientName,
    this.nameOfMedicalInstitution,
    this.dateAndTimeConsultaion,
    this.startTime,
    this.endTime,
    this.healthCheckPackage,
    this.optionName,
    this.checkupDate,
    this.date,
    this.time,
  });

  factory DetailItinerarySimpleTitleRequest.fromJson(Map<String,dynamic> json){
    return _$DetailItinerarySimpleTitleRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailItinerarySimpleTitleRequestToJson(this);
  }

}
