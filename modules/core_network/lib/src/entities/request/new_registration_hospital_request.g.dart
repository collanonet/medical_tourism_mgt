// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_registration_hospital_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewRegistrationHospitalRequest _$NewRegistrationHospitalRequestFromJson(
        Map<String, dynamic> json) =>
    NewRegistrationHospitalRequest(
      hospital: json['hospital'] as String,
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
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
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'classification': instance.classification,
      'shareThisQADataWithHospitals': instance.shareThisQADataWithHospitals,
      'question': instance.question,
      'answer': instance.answer,
    };
