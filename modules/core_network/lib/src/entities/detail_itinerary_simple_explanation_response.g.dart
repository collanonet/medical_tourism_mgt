// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_simple_explanation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailItinerarySimplePriorExplanationResponse
    _$DetailItinerarySimplePriorExplanationResponseFromJson(
            Map<String, dynamic> json) =>
        DetailItinerarySimplePriorExplanationResponse(
          id: json['_id'] as String?,
          explanationOfVariousTests:
              json['explanationOfVariousTests'] as String?,
          mealsBeforeAndOnTheDayOfTheExamination:
              json['mealsBeforeAndOnTheDayOfTheExamination'] as String?,
          aboutTakingMedicine: json['aboutTakingMedicine'] as String?,
          bringOnTheDayOfYourHealthCheck:
              json['bringOnTheDayOfYourHealthCheck'] as String?,
          otherConsiderations: json['otherConsiderations'] as String?,
        );

Map<String, dynamic> _$DetailItinerarySimplePriorExplanationResponseToJson(
        DetailItinerarySimplePriorExplanationResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'explanationOfVariousTests': instance.explanationOfVariousTests,
      'mealsBeforeAndOnTheDayOfTheExamination':
          instance.mealsBeforeAndOnTheDayOfTheExamination,
      'aboutTakingMedicine': instance.aboutTakingMedicine,
      'bringOnTheDayOfYourHealthCheck': instance.bringOnTheDayOfYourHealthCheck,
      'otherConsiderations': instance.otherConsiderations,
    };
