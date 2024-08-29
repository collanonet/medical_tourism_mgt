// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_itinerary_simple_version_tilte_response.g.dart';
@JsonSerializable()
class DetailItinerarySimpleTitle {
   @JsonKey(name: '_id')
  final String? id;
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

  DetailItinerarySimpleTitle({
    required this.id,
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

 factory DetailItinerarySimpleTitle.fromJson(Map<String,dynamic> json){
  return _$DetailItinerarySimpleTitleFromJson(json);
 }

 Map<String,dynamic> toJson(){
  return _$DetailItinerarySimpleTitleToJson(this);
 }

}
