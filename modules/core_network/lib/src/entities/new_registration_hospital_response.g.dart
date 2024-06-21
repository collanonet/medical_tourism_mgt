// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_registration_hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewRegistrationHospitalResponse _$NewRegistrationHospitalResponseFromJson(
        Map<String, dynamic> json) =>
    NewRegistrationHospitalResponse(
      id: json['_id'] as String?,
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

Map<String, dynamic> _$NewRegistrationHospitalResponseToJson(
        NewRegistrationHospitalResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'updateDate': instance.updateDate?.toIso8601String(),
      'updater': instance.updater,
      'classification': instance.classification,
      'shareThisQADataWithHospitals': instance.shareThisQADataWithHospitals,
      'question': instance.question,
      'answer': instance.answer,
    };
