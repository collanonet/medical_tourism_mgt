// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_registration_hospital_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewRegistrationHospitalRequest _$NewRegistrationHospitalRequestFromJson(
        Map<String, dynamic> json) =>
    NewRegistrationHospitalRequest(
      hospital: json['hospital'] as String,
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      updatedBy: json['updatedBy'] as String?,
      classification: json['classification'] as String?,
      shareThisQADataWithHospitals:
          json['shareThisQADataWithHospitals'] as bool?,
      question: json['question'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$NewRegistrationHospitalRequestToJson(
        NewRegistrationHospitalRequest instance) =>
    <String, dynamic>{
      'hospital': instance.hospital,
      'updateDate': instance.updateDate?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'classification': instance.classification,
      'shareThisQADataWithHospitals': instance.shareThisQADataWithHospitals,
      'question': instance.question,
      'answer': instance.answer,
    };
