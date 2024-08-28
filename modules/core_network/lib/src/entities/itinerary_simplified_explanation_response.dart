// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'itinerary_simplified_explanation_response.g.dart';
@JsonSerializable()
class ItineraryExplanationResponse {
  @JsonKey(name: '_id')
  final String id;
  String? explanationOfVariousTests;
  String? explanationOfVariousTestsNote;
  String? mealsBeforeAndOnTheDayOfTheTest;
  String? aboutTakingMedicine;
  String? whatToBringOnTheDayOfTheMedicalExamination;
  String? otherConsiderations;

  ItineraryExplanationResponse({
    required this.id,
     this.explanationOfVariousTests,
     this.explanationOfVariousTestsNote,
     this.mealsBeforeAndOnTheDayOfTheTest,
     this.aboutTakingMedicine,
     this.whatToBringOnTheDayOfTheMedicalExamination,
     this.otherConsiderations,
  });

  factory ItineraryExplanationResponse.fromJson(Map<String,dynamic> json){
    return _$ItineraryExplanationResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$ItineraryExplanationResponseToJson(this);
  }
}
