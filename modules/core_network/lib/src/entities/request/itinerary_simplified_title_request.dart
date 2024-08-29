// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'itinerary_simplified_title_request.g.dart';
@JsonSerializable()
class ItineraryTitleRequest {
  String? patientName;
  String? medicalInstitutionName;
  String? consultationDateAndTime;
  String? startTime;
  String? endingTimePlanned;
  String? healthCheckupPackage;
  List<AddOption>? addOptions;

  ItineraryTitleRequest({
     this.patientName,
     this.medicalInstitutionName,
     this.consultationDateAndTime,
     this.startTime,
     this.endingTimePlanned,
     this.healthCheckupPackage,
     this.addOptions,
  });

  factory ItineraryTitleRequest.fromJson(Map<String,dynamic> json){
    return _$ItineraryTitleRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$ItineraryTitleRequestToJson(this);
  }

  
}

@JsonSerializable()
class AddOption {
  String? optionName;
  String? medicalExaminationDay;
  String? date;
  String? time;

  AddOption({
     this.optionName,
     this.medicalExaminationDay,
     this.date,
     this.time,
  });

  factory AddOption.fromJson(Map<String,dynamic> json){
    return _$AddOptionFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$AddOptionToJson(this);
  }

}
