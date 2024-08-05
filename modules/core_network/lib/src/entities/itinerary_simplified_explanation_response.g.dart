// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_explanation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryExplanationResponse _$ItineraryExplanationResponseFromJson(
        Map<String, dynamic> json) =>
    ItineraryExplanationResponse(
      id: json['_id'] as String,
      explanationOfVariousTests: json['explanationOfVariousTests'] as String?,
      explanationOfVariousTestsNote:
          json['explanationOfVariousTestsNote'] as String?,
      mealsBeforeAndOnTheDayOfTheTest:
          json['mealsBeforeAndOnTheDayOfTheTest'] as String?,
      aboutTakingMedicine: json['aboutTakingMedicine'] as String?,
      whatToBringOnTheDayOfTheMedicalExamination:
          json['whatToBringOnTheDayOfTheMedicalExamination'] as String?,
      otherConsiderations: json['otherConsiderations'] as String?,
    );

Map<String, dynamic> _$ItineraryExplanationResponseToJson(
        ItineraryExplanationResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'explanationOfVariousTests': instance.explanationOfVariousTests,
      'explanationOfVariousTestsNote': instance.explanationOfVariousTestsNote,
      'mealsBeforeAndOnTheDayOfTheTest':
          instance.mealsBeforeAndOnTheDayOfTheTest,
      'aboutTakingMedicine': instance.aboutTakingMedicine,
      'whatToBringOnTheDayOfTheMedicalExamination':
          instance.whatToBringOnTheDayOfTheMedicalExamination,
      'otherConsiderations': instance.otherConsiderations,
    };
