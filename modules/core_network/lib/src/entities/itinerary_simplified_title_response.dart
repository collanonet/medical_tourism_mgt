
import 'package:json_annotation/json_annotation.dart';

import '../../entities.dart';
part 'itinerary_simplified_title_response.g.dart';
@JsonSerializable()
class ItineraryTitleResponse {
  @JsonKey(name: '_id')
  final String id;
  String? patientName;
  String? medicalInstitutionName;
  String? consultationDateAndTime;
  String? startTime;
  String? endingTimePlanned;
  String? healthCheckupPackage;
  List<AddOption>? addOptions;

  ItineraryTitleResponse({
    required this.id,
     this.patientName,
     this.medicalInstitutionName,
     this.consultationDateAndTime,
     this.startTime,
     this.endingTimePlanned,
     this.healthCheckupPackage,
     this.addOptions,
  });

  factory ItineraryTitleResponse.fromJson(Map<String,dynamic> json){
    return _$ItineraryTitleResponseFromJson(json);
  }
  
  Map<String,dynamic> toJson(){
    return _$ItineraryTitleResponseToJson(this);
  }
}
