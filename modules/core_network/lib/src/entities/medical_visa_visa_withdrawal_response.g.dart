// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_visa_withdrawal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaVisaWithdrawalResponse _$MedicalVisaVisaWithdrawalResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaVisaWithdrawalResponse(
      id: json['_id'] as String,
      subjectVisaWithdrawal: json['subjectVisaWithdrawal'] as String?,
      deathOrOccurrenceEventDate: json['deathOrOccurrenceEventDate'] == null
          ? null
          : DateTime.parse(json['deathOrOccurrenceEventDate'] as String),
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$MedicalVisaVisaWithdrawalResponseToJson(
        MedicalVisaVisaWithdrawalResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'subjectVisaWithdrawal': instance.subjectVisaWithdrawal,
      'deathOrOccurrenceEventDate':
          instance.deathOrOccurrenceEventDate?.toIso8601String(),
      'remarks': instance.remarks,
    };
