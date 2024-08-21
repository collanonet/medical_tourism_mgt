// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_related_parties_emergency_contact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRelatedPartiesEmergencyContactResponse
    _$DetailRelatedPartiesEmergencyContactResponseFromJson(
            Map<String, dynamic> json) =>
        DetailRelatedPartiesEmergencyContactResponse(
          id: json['_id'] as String?,
          dateYearFrom: json['dateYearFrom'] == null
              ? null
              : DateTime.parse(json['dateYearFrom'] as String),
          dateYearTo: json['dateYearTo'] == null
              ? null
              : DateTime.parse(json['dateYearTo'] as String),
          contactPersonNamaKanji: json['contactPersonNamaKanji'] as String?,
          contactPersonNameKana: json['contactPersonNameKana'] as String?,
          phoneNumber: json['phoneNumber'] as String?,
          tour: json['tour'] as String?,
        );

Map<String, dynamic> _$DetailRelatedPartiesEmergencyContactResponseToJson(
        DetailRelatedPartiesEmergencyContactResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'dateYearFrom': instance.dateYearFrom?.toIso8601String(),
      'dateYearTo': instance.dateYearTo?.toIso8601String(),
      'contactPersonNamaKanji': instance.contactPersonNamaKanji,
      'contactPersonNameKana': instance.contactPersonNameKana,
      'phoneNumber': instance.phoneNumber,
      'tour': instance.tour,
    };
