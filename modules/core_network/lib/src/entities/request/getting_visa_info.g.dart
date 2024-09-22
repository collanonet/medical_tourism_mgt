// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_visa_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VasaInfo _$VasaInfoFromJson(Map<String, dynamic> json) => VasaInfo(
      visaPage: json['visaPage'] == null
          ? null
          : DateTime.parse(json['visaPage'] as String),
      landingPermit: json['landingPermit'] == null
          ? null
          : DateTime.parse(json['landingPermit'] as String),
    );

Map<String, dynamic> _$VasaInfoToJson(VasaInfo instance) => <String, dynamic>{
      'visaPage': instance.visaPage?.toIso8601String(),
      'landingPermit': instance.landingPermit?.toIso8601String(),
    };
