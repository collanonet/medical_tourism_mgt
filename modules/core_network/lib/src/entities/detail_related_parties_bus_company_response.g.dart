// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_related_parties_bus_company_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRelatedPartiesBusCompanyResponse
    _$DetailRelatedPartiesBusCompanyResponseFromJson(
            Map<String, dynamic> json) =>
        DetailRelatedPartiesBusCompanyResponse(
          id: json['_id'] as String?,
          personInChargeOfArrangements:
              json['personInChargeOfArrangements'] as String?,
          busCompanyName: json['busCompanyName'] as String?,
          manager: json['manager'] as String?,
        );

Map<String, dynamic> _$DetailRelatedPartiesBusCompanyResponseToJson(
        DetailRelatedPartiesBusCompanyResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'personInChargeOfArrangements': instance.personInChargeOfArrangements,
      'busCompanyName': instance.busCompanyName,
      'manager': instance.manager,
    };
