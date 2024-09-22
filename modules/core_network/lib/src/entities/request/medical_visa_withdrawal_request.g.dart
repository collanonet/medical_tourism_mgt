// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_withdrawal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaWithdrawalRequest _$MedicalVisaWithdrawalRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaWithdrawalRequest(
      subjectVisaWithdrawal: json['subjectVisaWithdrawal'] as bool?,
      deathOrOccurrenceEventDate: json['deathOrOccurrenceEventDate'] == null
          ? null
          : DateTime.parse(json['deathOrOccurrenceEventDate'] as String),
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$MedicalVisaWithdrawalRequestToJson(
        MedicalVisaWithdrawalRequest instance) =>
    <String, dynamic>{
      'subjectVisaWithdrawal': instance.subjectVisaWithdrawal,
      'deathOrOccurrenceEventDate':
          instance.deathOrOccurrenceEventDate?.toIso8601String(),
      'remarks': instance.remarks,
    };
