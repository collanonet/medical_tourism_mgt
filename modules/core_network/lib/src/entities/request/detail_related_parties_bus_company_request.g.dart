// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_related_parties_bus_company_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRelatedPartiesBusCompanyRequest
    _$DetailRelatedPartiesBusCompanyRequestFromJson(
            Map<String, dynamic> json) =>
        DetailRelatedPartiesBusCompanyRequest(
          personInChargeOfArrangements:
              json['personInChargeOfArrangements'] as String?,
          busCompanyName: json['busCompanyName'] as String?,
          manager: json['manager'] as String?,
        );

Map<String, dynamic> _$DetailRelatedPartiesBusCompanyRequestToJson(
        DetailRelatedPartiesBusCompanyRequest instance) =>
    <String, dynamic>{
      'personInChargeOfArrangements': instance.personInChargeOfArrangements,
      'busCompanyName': instance.busCompanyName,
      'manager': instance.manager,
    };
