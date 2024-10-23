// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_final_final.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VasaInfo _$VasaInfoFromJson(Map<String, dynamic> json) => VasaInfo(
      id: json['_id'] as String,
      visaPage: json['visaPage'] == null
          ? null
          : DateTime.parse(json['visaPage'] as String),
      landingPermit: json['landingPermit'] == null
          ? null
          : DateTime.parse(json['landingPermit'] as String),
      landingPermitFileName: json['landingPermitFileName'] as String?,
      visaPageFileName: json['visaPageFileName'] as String?,
    );

Map<String, dynamic> _$VasaInfoToJson(VasaInfo instance) => <String, dynamic>{
      '_id': instance.id,
      'visaPage': instance.visaPage?.toIso8601String(),
      'visaPageFileName': instance.visaPageFileName,
      'landingPermit': instance.landingPermit?.toIso8601String(),
      'landingPermitFileName': instance.landingPermitFileName,
    };
