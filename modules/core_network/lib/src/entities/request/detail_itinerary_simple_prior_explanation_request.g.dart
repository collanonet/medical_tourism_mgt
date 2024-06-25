// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_simple_prior_explanation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailItinerarySimplePriorExplanationRequest
    _$DetailItinerarySimplePriorExplanationRequestFromJson(
            Map<String, dynamic> json) =>
        DetailItinerarySimplePriorExplanationRequest(
          explanationOfVariousTests:
              json['explanationOfVariousTests'] as String?,
          mealsBeforeAndOnTheDayOfTheExamination:
              json['mealsBeforeAndOnTheDayOfTheExamination'] as String?,
          aboutTakingMedicine: json['aboutTakingMedicine'] as String?,
          bringOnTheDayOfYourHealthCheck:
              json['bringOnTheDayOfYourHealthCheck'] as String?,
          otherConsiderations: json['otherConsiderations'] as String?,
        );

Map<String, dynamic> _$DetailItinerarySimplePriorExplanationRequestToJson(
        DetailItinerarySimplePriorExplanationRequest instance) =>
    <String, dynamic>{
      'explanationOfVariousTests': instance.explanationOfVariousTests,
      'mealsBeforeAndOnTheDayOfTheExamination':
          instance.mealsBeforeAndOnTheDayOfTheExamination,
      'aboutTakingMedicine': instance.aboutTakingMedicine,
      'bringOnTheDayOfYourHealthCheck': instance.bringOnTheDayOfYourHealthCheck,
      'otherConsiderations': instance.otherConsiderations,
    };
