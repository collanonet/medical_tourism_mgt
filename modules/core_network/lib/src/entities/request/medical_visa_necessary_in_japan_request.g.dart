// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_necessary_in_japan_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaNecessaryInJapanRequest _$MedicalVisaNecessaryInJapanRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaNecessaryInJapanRequest(
      visaInfo: (json['visaInfo'] as List<dynamic>?)
          ?.map((e) => VisaInfoRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => ScheduleRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      statementOfReasonsDate: json['statementOfReasonsDate'] == null
          ? null
          : DateTime.parse(json['statementOfReasonsDate'] as String),
      travelCompanionListDate: json['travelCompanionListDate'] == null
          ? null
          : DateTime.parse(json['travelCompanionListDate'] as String),
      statementOfReasonsDateFileName:
          json['statementOfReasonsDateFileName'] as String?,
      travelCompanionListFileName:
          json['travelCompanionListFileName'] as String?,
    );

Map<String, dynamic> _$MedicalVisaNecessaryInJapanRequestToJson(
        MedicalVisaNecessaryInJapanRequest instance) =>
    <String, dynamic>{
      'visaInfo': instance.visaInfo,
      'schedule': instance.schedule,
      'statementOfReasonsDate':
          instance.statementOfReasonsDate?.toIso8601String(),
      'statementOfReasonsDateFileName': instance.statementOfReasonsDateFileName,
      'travelCompanionListDate':
          instance.travelCompanionListDate?.toIso8601String(),
      'travelCompanionListFileName': instance.travelCompanionListFileName,
    };
