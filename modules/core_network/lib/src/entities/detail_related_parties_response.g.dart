// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_related_parties_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRelatedPartiesResponse _$DetailRelatedPartiesResponseFromJson(
        Map<String, dynamic> json) =>
    DetailRelatedPartiesResponse(
      id: json['_id'] as String?,
      arrangePerson: json['arrangePerson'] as String?,
      dateFrom: json['dateFrom'] == null
          ? null
          : DateTime.parse(json['dateFrom'] as String),
      dateTo: json['dateTo'] == null
          ? null
          : DateTime.parse(json['dateTo'] as String),
      guideNamaKanji: json['guideNamaKanji'] as String?,
      guideNameKana: json['guideNameKana'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      qualification: (json['qualification'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      report: json['report'] as String?,
      accommodationAvailability: json['accommodationAvailability'] as String?,
      accommodationName: json['accommodationName'] as String?,
      address: json['address'] as String?,
      phoneNumber2: json['phoneNumber2'] as String?,
    )..tour = json['tour'] as String?;

Map<String, dynamic> _$DetailRelatedPartiesResponseToJson(
        DetailRelatedPartiesResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'arrangePerson': instance.arrangePerson,
      'dateFrom': instance.dateFrom?.toIso8601String(),
      'dateTo': instance.dateTo?.toIso8601String(),
      'guideNamaKanji': instance.guideNamaKanji,
      'guideNameKana': instance.guideNameKana,
      'phoneNumber': instance.phoneNumber,
      'qualification': instance.qualification,
      'report': instance.report,
      'accommodationAvailability': instance.accommodationAvailability,
      'accommodationName': instance.accommodationName,
      'address': instance.address,
      'phoneNumber2': instance.phoneNumber2,
      'tour': instance.tour,
    };
