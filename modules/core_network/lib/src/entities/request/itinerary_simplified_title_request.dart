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
  String? patientId;
  List<AddOption>? addOptions;

  ItineraryTitleRequest({
     this.patientName,
     this.medicalInstitutionName,
     this.consultationDateAndTime,
     this.startTime,
     this.endingTimePlanned,
     this.healthCheckupPackage,
     this.patientId,
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
  @JsonKey(name: 'option_name')
  String? optionName;
  @JsonKey(name: 'medical_examination_day')
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
