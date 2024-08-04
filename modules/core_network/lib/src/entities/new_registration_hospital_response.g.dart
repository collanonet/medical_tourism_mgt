// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_registration_hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewRegistrationHospitalResponse _$NewRegistrationHospitalResponseFromJson(
        Map<String, dynamic> json) =>
    NewRegistrationHospitalResponse(
      id: json['_id'] as String,
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
      updatedBy: json['updatedBy'] as String?,
      classification: json['classification'] as String?,
      shareThisQADataWithHospitals:
          json['shareThisQADataWithHospitals'] as bool?,
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      hospital: json['hospital'] as String?,
    );

Map<String, dynamic> _$NewRegistrationHospitalResponseToJson(
        NewRegistrationHospitalResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'classification': instance.classification,
      'shareThisQADataWithHospitals': instance.shareThisQADataWithHospitals,
      'question': instance.question,
      'answer': instance.answer,
      'hospital': instance.hospital,
    };
