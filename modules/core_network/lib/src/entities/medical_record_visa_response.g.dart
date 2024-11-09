// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_visa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordVisaResponse _$MedicalRecordVisaResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordVisaResponse(
      id: json['_id'] as String,
      medicalRecord: json['medicalRecord'] as String,
      personal: (json['personal'] as List<dynamic>?)
          ?.map((e) =>
              MedicalVisaPersonalResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      stayPeriod: (json['stayPeriod'] as List<dynamic>?)
          ?.map((e) =>
              MedicalVisaStayPeriodResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiredInJapan: json['requiredInJapan'] == null
          ? null
          : MedicalVisaRequiredInJapanResponse.fromJson(
              json['requiredInJapan'] as Map<String, dynamic>),
      visaWithdrawal: json['visaWithdrawal'] == null
          ? null
          : MedicalVisaVisaWithdrawalResponse.fromJson(
              json['visaWithdrawal'] as Map<String, dynamic>),
      afterGettingVisa: json['afterGettingVisa'] == null
          ? null
          : AfterGettingVisaResponse.fromJson(
              json['afterGettingVisa'] as Map<String, dynamic>),
      travelCompanion: json['travelCompanion'] == null
          ? null
          : MedicalVisaTravelCompanionResponse.fromJson(
              json['travelCompanion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MedicalRecordVisaResponseToJson(
        MedicalRecordVisaResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'medicalRecord': instance.medicalRecord,
      'personal': instance.personal,
      'stayPeriod': instance.stayPeriod,
      'requiredInJapan': instance.requiredInJapan,
      'visaWithdrawal': instance.visaWithdrawal,
      'afterGettingVisa': instance.afterGettingVisa,
      'travelCompanion': instance.travelCompanion,
    };
