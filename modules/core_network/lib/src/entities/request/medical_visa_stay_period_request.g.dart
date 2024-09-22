// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_stay_period_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaStayPeriodRequest _$MedicalVisaStayPeriodRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaStayPeriodRequest(
      stayStartingDatePersonalReference:
          json['stayStartingDatePersonalReference'] == null
              ? null
              : DateTime.parse(
                  json['stayStartingDatePersonalReference'] as String),
      stayEndDate: json['stayEndDate'] == null
          ? null
          : DateTime.parse(json['stayEndDate'] as String),
    );

Map<String, dynamic> _$MedicalVisaStayPeriodRequestToJson(
        MedicalVisaStayPeriodRequest instance) =>
    <String, dynamic>{
      'stayStartingDatePersonalReference':
          instance.stayStartingDatePersonalReference?.toIso8601String(),
      'stayEndDate': instance.stayEndDate?.toIso8601String(),
    };
