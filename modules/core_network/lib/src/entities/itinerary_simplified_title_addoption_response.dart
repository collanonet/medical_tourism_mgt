
import 'package:json_annotation/json_annotation.dart';
part 'itinerary_simplified_title_addoption_response.g.dart';
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