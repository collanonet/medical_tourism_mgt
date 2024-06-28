import 'package:json_annotation/json_annotation.dart';

import '../../entities.dart';
import 'detail_itinerary_data_response.dart';
part 'detail_itinerary_response.g.dart';
@JsonSerializable()
class DetailItineraryResponse {
  @JsonKey(name: '_id')
  final String? id;
  List<Patient>? patientNames;
  String? tourName;
  String? numberOfPeople;
  String? group;
  String? type;
  List<Day>? days;

  DetailItineraryResponse({
    required this.id,
     this.patientNames,
     this.tourName,
     this.numberOfPeople,
     this.type,
     this.group,
     this.days,
  });

  factory DetailItineraryResponse.fromJson(Map<String,dynamic> json){
    return _$DetailItineraryResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailItineraryResponseToJson(this);
  }
  
}