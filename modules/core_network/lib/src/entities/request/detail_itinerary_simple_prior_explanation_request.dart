import 'package:json_annotation/json_annotation.dart';
part 'detail_itinerary_simple_prior_explanation_request.g.dart';
@JsonSerializable()
class DetailItinerarySimplePriorExplanationRequest {
  String? explanationOfVariousTests;
  String? mealsBeforeAndOnTheDayOfTheExamination;
  String? aboutTakingMedicine;
  String? bringOnTheDayOfYourHealthCheck;
  String? otherConsiderations;

  DetailItinerarySimplePriorExplanationRequest({
    this.explanationOfVariousTests,
    this.mealsBeforeAndOnTheDayOfTheExamination,
    this.aboutTakingMedicine,
    this.bringOnTheDayOfYourHealthCheck,
    this.otherConsiderations,
  });

  factory DetailItinerarySimplePriorExplanationRequest.fromJson(Map<String,dynamic> json){
    return _$DetailItinerarySimplePriorExplanationRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailItinerarySimplePriorExplanationRequestToJson(this);
  }
}