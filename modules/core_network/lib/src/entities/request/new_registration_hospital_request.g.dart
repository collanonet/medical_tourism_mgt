// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_registration_hospital_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewRegistrationHospitalRequest _$NewRegistrationHospitalRequestFromJson(
        Map<String, dynamic> json) =>
    NewRegistrationHospitalRequest(
      hospitalId: json['hospitalId'] as String,
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      updater: json['updater'] as String?,
      classification: json['classification'] as String?,
      shareThisQADataWithHospitals:
          json['shareThisQADataWithHospitals'] as bool?,
      question: json['question'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$NewRegistrationHospitalRequestToJson(
        NewRegistrationHospitalRequest instance) =>
    <String, dynamic>{
      'hospitalId': instance.hospitalId,
      'updateDate': instance.updateDate?.toIso8601String(),
      'updater': instance.updater,
      'classification': instance.classification,
      'shareThisQADataWithHospitals': instance.shareThisQADataWithHospitals,
      'question': instance.question,
      'answer': instance.answer,
    };
