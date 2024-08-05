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
          dateFrom: json['dateFrom'] as String? ?? '',
          dateTo: json['dateTo'] as String? ?? '',
          personInChargeKanji: json['personInChargeKanji'] as String? ?? '',
          personInChargeKana: json['personInChargeKana'] as String? ?? '',
          telephoneNumber: json['telephoneNumber'] as String? ?? '',
        );

Map<String, dynamic> _$DetailRelatedPartiesEmergencyContactResponseToJson(
        DetailRelatedPartiesEmergencyContactResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'personInChargeKanji': instance.personInChargeKanji,
      'personInChargeKana': instance.personInChargeKana,
      'telephoneNumber': instance.telephoneNumber,
    };
