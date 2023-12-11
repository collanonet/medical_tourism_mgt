// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_referrer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordReferrerRequest _$MedicalRecordReferrerRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordReferrerRequest(
      company: json['company'] as String?,
      nameInKanji: json['nameInKanji'] as String?,
      nameInKana: json['nameInKana'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$MedicalRecordReferrerRequestToJson(
        MedicalRecordReferrerRequest instance) =>
    <String, dynamic>{
      'company': instance.company,
      'nameInKanji': instance.nameInKanji,
      'nameInKana': instance.nameInKana,
      'medicalRecord': instance.medicalRecord,
    };
