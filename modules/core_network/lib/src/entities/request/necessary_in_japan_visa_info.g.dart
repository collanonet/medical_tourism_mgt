// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'necessary_in_japan_visa_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisaInfo _$VisaInfoFromJson(Map<String, dynamic> json) => VisaInfo(
      passportDate: json['passportDate'] == null
          ? null
          : DateTime.parse(json['passportDate'] as String),
      passportFileSelect: json['passportFileSelect'] as String?,
      letterOfGuaranteeDate: json['letterOfGuaranteeDate'] == null
          ? null
          : DateTime.parse(json['letterOfGuaranteeDate'] as String),
      letterOfGuaranteeFileSelect:
          json['letterOfGuaranteeFileSelect'] as String?,
      sendBy: json['sendBy'] as String?,
      byEMS: json['byEMS'] as bool?,
      byFedex: json['byFedex'] as bool?,
      byothers: json['byothers'] as bool?,
    );

Map<String, dynamic> _$VisaInfoToJson(VisaInfo instance) => <String, dynamic>{
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
