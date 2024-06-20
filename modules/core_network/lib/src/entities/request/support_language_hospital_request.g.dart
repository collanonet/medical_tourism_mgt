// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_language_hospital_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportLanguageHospitalRequest _$SupportLanguageHospitalRequestFromJson(
        Map<String, dynamic> json) =>
    SupportLanguageHospitalRequest(
      id: json['_id'] as String?,
      hospital: json['hospital'] as String,
      supportLanguage: json['supportLanguage'] as String?,
      foreignStaff: json['foreignStaff'] as bool?,
      medicalInterpretationSupport:
          json['medicalInterpretationSupport'] as bool?,
    );

Map<String, dynamic> _$SupportLanguageHospitalRequestToJson(
        SupportLanguageHospitalRequest instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospital': instance.hospital,
      'supportLanguage': instance.supportLanguage,
      'foreignStaff': instance.foreignStaff,
      'medicalInterpretationSupport': instance.medicalInterpretationSupport,
    };
