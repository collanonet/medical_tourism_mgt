// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_stay_period_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaStayPeriodResponse _$MedicalVisaStayPeriodResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaStayPeriodResponse(
      id: json['_id'] as String?,
      stayStartingDatePersonalReference:
          json['stayStartingDatePersonalReference'] == null
              ? null
              : DateTime.parse(
                  json['stayStartingDatePersonalReference'] as String),
      stayEndDate: json['stayEndDate'] == null
          ? null
          : DateTime.parse(json['stayEndDate'] as String),
    );

Map<String, dynamic> _$MedicalVisaStayPeriodResponseToJson(
        MedicalVisaStayPeriodResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'stayStartingDatePersonalReference':
          instance.stayStartingDatePersonalReference?.toIso8601String(),
      'stayEndDate': instance.stayEndDate?.toIso8601String(),
    };
