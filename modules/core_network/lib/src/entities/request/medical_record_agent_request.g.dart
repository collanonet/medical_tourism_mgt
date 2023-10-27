// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_agent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordAgentRequest _$MedicalRecordAgentRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordAgentRequest(
      company: json['company'] as String?,
      nameInKanji: json['nameInKanji'] as String?,
      nameInKana: json['nameInKana'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$MedicalRecordAgentRequestToJson(
        MedicalRecordAgentRequest instance) =>
    <String, dynamic>{
      'company': instance.company,
      'nameInKanji': instance.nameInKanji,
      'nameInKana': instance.nameInKana,
      'medicalRecord': instance.medicalRecord,
    };
