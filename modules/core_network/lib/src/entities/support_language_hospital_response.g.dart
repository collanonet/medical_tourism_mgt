// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_language_hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportLanguageHospitalResponse _$SupportLanguageHospitalResponseFromJson(
        Map<String, dynamic> json) =>
    SupportLanguageHospitalResponse(
      id: json['_id'] as String,
      hospital: json['hospital'] as String,
      supportLanguage: json['supportLanguage'] as String?,
      foreignStaff: json['foreignStaff'] as bool?,
      medicalInterpretationSupport:
          json['medicalInterpretationSupport'] as bool?,
    );

Map<String, dynamic> _$SupportLanguageHospitalResponseToJson(
        SupportLanguageHospitalResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospital': instance.hospital,
      'supportLanguage': instance.supportLanguage,
      'foreignStaff': instance.foreignStaff,
      'medicalInterpretationSupport': instance.medicalInterpretationSupport,
    };
