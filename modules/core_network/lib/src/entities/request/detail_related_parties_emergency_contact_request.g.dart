// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_related_parties_emergency_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRelatedPartiesEmergencyContactRequest
    _$DetailRelatedPartiesEmergencyContactRequestFromJson(
            Map<String, dynamic> json) =>
        DetailRelatedPartiesEmergencyContactRequest(
          dateYearFrom: json['dateYearFrom'] as String? ?? '',
          dateYearTo: json['dateYearTo'] as String? ?? '',
          contactPersonNamaKanji:
              json['contactPersonNamaKanji'] as String? ?? '',
          contactPersonNameKana: json['contactPersonNameKana'] as String? ?? '',
          phoneNumber: json['phoneNumber'] as String? ?? '',
          tour: json['tour'] as String? ?? '',
        );

Map<String, dynamic> _$DetailRelatedPartiesEmergencyContactRequestToJson(
        DetailRelatedPartiesEmergencyContactRequest instance) =>
    <String, dynamic>{
      'dateYearFrom': instance.dateYearFrom,
      'dateYearTo': instance.dateYearTo,
      'contactPersonNamaKanji': instance.contactPersonNamaKanji,
      'contactPersonNameKana': instance.contactPersonNameKana,
      'phoneNumber': instance.phoneNumber,
      'tour': instance.tour,
    };
