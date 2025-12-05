// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_explanation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryExplanationResponse _$ItineraryExplanationResponseFromJson(
        Map<String, dynamic> json) {
  final explanationData = json['explanation'] as Map<String, dynamic>? ?? json;
  return ItineraryExplanationResponse(
    id: json['_id'] as String,
    explanationOfVariousTests:
        explanationData['explanationOfVariousTests'] as String?,
    explanationOfVariousTestsNote:
        explanationData['explanationOfVariousTestsNote'] as String?,
    mealsBeforeAndOnTheDayOfTheTest:
        explanationData['mealsBeforeAndOnTheDayOfTheTest'] as String?,
    aboutTakingMedicine: explanationData['aboutTakingMedicine'] as String?,
    whatToBringOnTheDayOfTheMedicalExamination:
        explanationData['whatToBringOnTheDayOfTheMedicalExamination'] as String?,
    otherConsiderations: explanationData['otherConsiderations'] as String?,
  );
}

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
