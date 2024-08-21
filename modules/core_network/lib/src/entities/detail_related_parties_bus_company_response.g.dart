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
          arrangePerson: json['arrangePerson'] as String?,
          busCompanyName: json['busCompanyName'] as String?,
          contactPerson: json['contactPerson'] as String?,
          tour: json['tour'] as String?,
        );

Map<String, dynamic> _$DetailRelatedPartiesBusCompanyResponseToJson(
        DetailRelatedPartiesBusCompanyResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'arrangePerson': instance.arrangePerson,
      'busCompanyName': instance.busCompanyName,
      'contactPerson': instance.contactPerson,
      'tour': instance.tour,
    };
