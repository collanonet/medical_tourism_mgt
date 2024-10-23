// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_visa_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GettingVisaInfoRequest _$GettingVisaInfoRequestFromJson(
        Map<String, dynamic> json) =>
    GettingVisaInfoRequest(
      visaPage: json['visaPage'] == null
          ? null
          : DateTime.parse(json['visaPage'] as String),
      landingPermit: json['landingPermit'] == null
          ? null
          : DateTime.parse(json['landingPermit'] as String),
      landingPermitFileName: json['landingPermitFileName'] as String?,
      visaPageFileName: json['visaPageFileName'] as String?,
    );

Map<String, dynamic> _$GettingVisaInfoRequestToJson(
        GettingVisaInfoRequest instance) =>
    <String, dynamic>{
      'visaPage': instance.visaPage?.toIso8601String(),
      'visaPageFileName': instance.visaPageFileName,
      'landingPermit': instance.landingPermit?.toIso8601String(),
      'landingPermitFileName': instance.landingPermitFileName,
    };
