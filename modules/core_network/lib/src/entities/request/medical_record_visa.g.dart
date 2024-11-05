// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_visa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordVisaRequest _$MedicalRecordVisaRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordVisaRequest(
      medicalRecord: json['medicalRecord'] as String?,
      personal: (json['personal'] as List<dynamic>?)
          ?.map((e) =>
              MedicalVisaPersonalRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      stayPeriod: (json['stayPeriod'] as List<dynamic>?)
          ?.map((e) =>
              MedicalVisaStayPeriodRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiredInJapan: json['requiredInJapan'] == null
          ? null
          : RequiredInJapan.fromJson(
              json['requiredInJapan'] as Map<String, dynamic>),
      visaWithdrawal: json['visaWithdrawal'] == null
          ? null
          : MedicalVisaWithdrawalRequest.fromJson(
              json['visaWithdrawal'] as Map<String, dynamic>),
      afterGettingVisa: json['afterGettingVisa'] == null
          ? null
          : AfterGettingVisaRequest.fromJson(
              json['afterGettingVisa'] as Map<String, dynamic>),
      travelCompanion: json['travelCompanion'] == null
          ? null
          : MedicalVisaTravelCompanionRequest.fromJson(
              json['travelCompanion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MedicalRecordVisaRequestToJson(
        MedicalRecordVisaRequest instance) =>
    <String, dynamic>{
      'medicalRecord': instance.medicalRecord,
      'personal': instance.personal,
      'stayPeriod': instance.stayPeriod,
      'requiredInJapan': instance.requiredInJapan,
      'visaWithdrawal': instance.visaWithdrawal,
      'afterGettingVisa': instance.afterGettingVisa,
      'travelCompanion': instance.travelCompanion,
    };
