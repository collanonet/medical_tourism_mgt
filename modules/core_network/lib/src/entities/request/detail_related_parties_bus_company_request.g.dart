// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_related_parties_bus_company_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRelatedPartiesBusCompanyRequest
    _$DetailRelatedPartiesBusCompanyRequestFromJson(
            Map<String, dynamic> json) =>
        DetailRelatedPartiesBusCompanyRequest(
          arrangePerson: json['arrangePerson'] as String?,
          busCompanyName: json['busCompanyName'] as String?,
          contactPerson: json['contactPerson'] as String?,
          tour: json['tour'] as String?,
        );

Map<String, dynamic> _$DetailRelatedPartiesBusCompanyRequestToJson(
        DetailRelatedPartiesBusCompanyRequest instance) =>
    <String, dynamic>{
      'arrangePerson': instance.arrangePerson,
      'busCompanyName': instance.busCompanyName,
      'contactPerson': instance.contactPerson,
      'tour': instance.tour,
    };
