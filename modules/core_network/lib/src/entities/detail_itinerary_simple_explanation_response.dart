// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_itinerary_simple_explanation_response.g.dart';
@JsonSerializable()
class DetailItinerarySimplePriorExplanationResponse {
   @JsonKey(name: '_id')
  final String? id;
  String? explanationOfVariousTests;
  String? mealsBeforeAndOnTheDayOfTheExamination;
  String? aboutTakingMedicine;
  String? bringOnTheDayOfYourHealthCheck;
  String? otherConsiderations;

  DetailItinerarySimplePriorExplanationResponse({
    required this.id,
    this.explanationOfVariousTests,
    this.mealsBeforeAndOnTheDayOfTheExamination,
    this.aboutTakingMedicine,
    this.bringOnTheDayOfYourHealthCheck,
    this.otherConsiderations,
  });

  factory DetailItinerarySimplePriorExplanationResponse.fromJson(Map<String,dynamic> json){
    return _$DetailItinerarySimplePriorExplanationResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailItinerarySimplePriorExplanationResponseToJson(this);
  }
}
