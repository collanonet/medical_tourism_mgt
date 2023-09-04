// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_confirm_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterConfirmResponse _$RegisterConfirmResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterConfirmResponse(
      referenceData: json['referenceData'] as String,
      hasLegacy: json['hasLegacy'] as bool,
      businesses: (json['businesses'] as List<dynamic>?)
          ?.map((e) => LegacyBusiness.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegisterConfirmResponseToJson(
        RegisterConfirmResponse instance) =>
    <String, dynamic>{
      'referenceData': instance.referenceData,
      'hasLegacy': instance.hasLegacy,
      'businesses': instance.businesses,
    };
