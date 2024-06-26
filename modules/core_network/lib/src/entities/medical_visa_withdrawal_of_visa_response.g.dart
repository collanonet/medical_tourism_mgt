// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_withdrawal_of_visa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaWithdrawalOfVisaResponse
    _$MedicalVisaWithdrawalOfVisaResponseFromJson(Map<String, dynamic> json) =>
        MedicalVisaWithdrawalOfVisaResponse(
          id: json['_id'] as String,
          subjectToVisaWithdrawal: json['subjectToVisaWithdrawal'] as bool?,
          deathOrOccurrenceEventDate: json['deathOrOccurrenceEventDate'] == null
              ? null
              : DateTime.parse(json['deathOrOccurrenceEventDate'] as String),
          remarks: json['remarks'] as String?,
        );

Map<String, dynamic> _$MedicalVisaWithdrawalOfVisaResponseToJson(
        MedicalVisaWithdrawalOfVisaResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'subjectToVisaWithdrawal': instance.subjectToVisaWithdrawal,
      'deathOrOccurrenceEventDate':
          instance.deathOrOccurrenceEventDate?.toIso8601String(),
      'remarks': instance.remarks,
    };
