// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_explanation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryExplanationRequest _$ItineraryExplanationRequestFromJson(
        Map<String, dynamic> json) =>
    ItineraryExplanationRequest(
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

Map<String, dynamic> _$ItineraryExplanationRequestToJson(
        ItineraryExplanationRequest instance) =>
    <String, dynamic>{
      'explanationOfVariousTests': instance.explanationOfVariousTests,
      'explanationOfVariousTestsNote': instance.explanationOfVariousTestsNote,
      'mealsBeforeAndOnTheDayOfTheTest':
          instance.mealsBeforeAndOnTheDayOfTheTest,
      'aboutTakingMedicine': instance.aboutTakingMedicine,
      'whatToBringOnTheDayOfTheMedicalExamination':
          instance.whatToBringOnTheDayOfTheMedicalExamination,
      'otherConsiderations': instance.otherConsiderations,
    };
