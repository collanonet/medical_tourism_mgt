// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_related_parties_emergency_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRelatedPartiesEmergencyContactRequest
    _$DetailRelatedPartiesEmergencyContactRequestFromJson(
            Map<String, dynamic> json) =>
        DetailRelatedPartiesEmergencyContactRequest(
          dateFrom: json['dateFrom'] as String? ?? '',
          dateTo: json['dateTo'] as String? ?? '',
          personInChargeKanji: json['personInChargeKanji'] as String? ?? '',
          personInChargeKana: json['personInChargeKana'] as String? ?? '',
          telephoneNumber: json['telephoneNumber'] as String? ?? '',
        );

Map<String, dynamic> _$DetailRelatedPartiesEmergencyContactRequestToJson(
        DetailRelatedPartiesEmergencyContactRequest instance) =>
    <String, dynamic>{
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'personInChargeKanji': instance.personInChargeKanji,
      'personInChargeKana': instance.personInChargeKana,
      'telephoneNumber': instance.telephoneNumber,
    };
