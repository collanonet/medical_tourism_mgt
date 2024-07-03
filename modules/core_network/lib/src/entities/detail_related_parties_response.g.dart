// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_related_parties_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRelatedPartiesResponse _$DetailRelatedPartiesResponseFromJson(
        Map<String, dynamic> json) =>
    DetailRelatedPartiesResponse(
      id: json['_id'] as String?,
      personInChargeOfArrangements:
          json['personInChargeOfArrangements'] as String?,
      dateFrom: json['dateFrom'] as String?,
      dateTo: json['dateTo'] as String?,
      guideNameKanji: json['guideNameKanji'] as String?,
      guideNameKana: json['guideNameKana'] as String?,
      telephoneNumber1: json['telephoneNumber1'] as String?,
      qualification: json['qualification'] as String?,
      report: json['report'] as String?,
      accommodationPossible: json['accommodationPossible'] as String?,
      nameOfFacility: json['nameOfFacility'] as String?,
      location: json['location'] as String?,
      telephoneNumber2: json['telephoneNumber2'] as String?,
      itineraryManagement: json['itineraryManagement'] as bool?,
      guideInterpreter: json['guideInterpreter'] as bool?,
      medicalInterpreter: json['medicalInterpreter'] as bool?,
      possibilityOfStayingTogether:
          json['possibilityOfStayingTogether'] as bool?,
    );

Map<String, dynamic> _$DetailRelatedPartiesResponseToJson(
        DetailRelatedPartiesResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'personInChargeOfArrangements': instance.personInChargeOfArrangements,
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'guideNameKanji': instance.guideNameKanji,
      'guideNameKana': instance.guideNameKana,
      'telephoneNumber1': instance.telephoneNumber1,
      'qualification': instance.qualification,
      'report': instance.report,
      'accommodationPossible': instance.accommodationPossible,
      'nameOfFacility': instance.nameOfFacility,
      'location': instance.location,
      'telephoneNumber2': instance.telephoneNumber2,
      'itineraryManagement': instance.itineraryManagement,
      'guideInterpreter': instance.guideInterpreter,
      'medicalInterpreter': instance.medicalInterpreter,
      'possibilityOfStayingTogether': instance.possibilityOfStayingTogether,
    };
