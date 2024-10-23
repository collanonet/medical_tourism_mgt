// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visa_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisaInfoRequest _$VisaInfoRequestFromJson(Map<String, dynamic> json) =>
    VisaInfoRequest(
      passportDate: json['passportDate'] == null
          ? null
          : DateTime.parse(json['passportDate'] as String),
      letterOfGuaranteeDate: json['letterOfGuaranteeDate'] == null
          ? null
          : DateTime.parse(json['letterOfGuaranteeDate'] as String),
      sendBy: json['sendBy'] as String?,
      byEMS: json['byEMS'] as bool?,
      byFedex: json['byFedex'] as bool?,
      byothers: json['byothers'] as bool?,
      passportFileSelect: json['passportFileSelect'] as String?,
      letterOfGuaranteeFileSelect:
          json['letterOfGuaranteeFileSelect'] as String?,
    );

Map<String, dynamic> _$VisaInfoRequestToJson(VisaInfoRequest instance) =>
    <String, dynamic>{
      'passportDate': instance.passportDate?.toIso8601String(),
      'passportFileSelect': instance.passportFileSelect,
      'letterOfGuaranteeDate':
          instance.letterOfGuaranteeDate?.toIso8601String(),
      'letterOfGuaranteeFileSelect': instance.letterOfGuaranteeFileSelect,
      'sendBy': instance.sendBy,
      'byEMS': instance.byEMS,
      'byFedex': instance.byFedex,
      'byothers': instance.byothers,
    };
