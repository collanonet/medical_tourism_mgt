// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_reuied_in_japan_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequiredInJapan _$RequiredInJapanFromJson(Map<String, dynamic> json) =>
    RequiredInJapan(
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
      travelInfo: (json['travelInfo'] as List<dynamic>?)
          ?.map((e) => TravelInfoRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      statementOfReasonsFileSelect:
          json['statementOfReasonsFileSelect'] as String?,
      travelCompanionListFileSelect:
          json['travelCompanionListFileSelect'] as String?,
    );

Map<String, dynamic> _$RequiredInJapanToJson(RequiredInJapan instance) =>
    <String, dynamic>{
      'visaInfo': instance.visaInfo,
      'schedule': instance.schedule,
      'statementOfReasonsDate':
          instance.statementOfReasonsDate?.toIso8601String(),
      'statementOfReasonsFileSelect': instance.statementOfReasonsFileSelect,
      'travelCompanionListDate':
          instance.travelCompanionListDate?.toIso8601String(),
      'travelCompanionListFileSelect': instance.travelCompanionListFileSelect,
      'travelInfo': instance.travelInfo,
    };
