
import 'package:json_annotation/json_annotation.dart';
part 'itinerary_simplified_explanation_request.g.dart';
@JsonSerializable()
class ItineraryExplanationRequest {
  String? explanationOfVariousTests;
  String? explanationOfVariousTestsNote;
  String? mealsBeforeAndOnTheDayOfTheTest;
  String? aboutTakingMedicine;
  String? whatToBringOnTheDayOfTheMedicalExamination;
  String? otherConsiderations;

  ItineraryExplanationRequest({
     this.explanationOfVariousTests,
     this.explanationOfVariousTestsNote,
     this.mealsBeforeAndOnTheDayOfTheTest,
     this.aboutTakingMedicine,
     this.whatToBringOnTheDayOfTheMedicalExamination,
     this.otherConsiderations,
  });

  factory ItineraryExplanationRequest.fromJson(Map<String,dynamic> json){
    return _$ItineraryExplanationRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$ItineraryExplanationRequestToJson(this);
  }
}