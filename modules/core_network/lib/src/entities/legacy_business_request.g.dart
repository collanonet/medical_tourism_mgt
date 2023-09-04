// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legacy_business_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegacyBusinessRequest _$LegacyBusinessRequestFromJson(
        Map<String, dynamic> json) =>
    LegacyBusinessRequest(
      referenceData: json['referenceData'] as String,
      businesses: (json['businesses'] as List<dynamic>)
          .map((e) => LegacyBusiness.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LegacyBusinessRequestToJson(
        LegacyBusinessRequest instance) =>
    <String, dynamic>{
      'referenceData': instance.referenceData,
      'businesses': instance.businesses,
    };
