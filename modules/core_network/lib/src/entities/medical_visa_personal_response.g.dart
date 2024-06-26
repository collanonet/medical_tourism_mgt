// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_personal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaPersonalResponse _$MedicalVisaPersonalResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaPersonalResponse(
      id: json['_id'] as String,
      medicalVisa: json['medicalVisa'] as String?,
      issueDate: json['issueDate'] == null
          ? null
          : DateTime.parse(json['issueDate'] as String),
      expirationDate: json['expirationDate'] == null
          ? null
          : DateTime.parse(json['expirationDate'] as String),
      accompanyingPersonsNumber: json['accompanyingPersonsNumber'] as String?,
      visaIssuingOverseasEstablishments:
          json['visaIssuingOverseasEstablishments'] as String?,
      remarks: json['remarks'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
    )..applicationDate = json['applicationDate'] == null
        ? null
        : DateTime.parse(json['applicationDate'] as String);

Map<String, dynamic> _$MedicalVisaPersonalResponseToJson(
        MedicalVisaPersonalResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'medicalVisa': instance.medicalVisa,
      'applicationDate': instance.applicationDate?.toIso8601String(),
      'issueDate': instance.issueDate?.toIso8601String(),
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'accompanyingPersonsNumber': instance.accompanyingPersonsNumber,
      'visaIssuingOverseasEstablishments':
          instance.visaIssuingOverseasEstablishments,
      'remarks': instance.remarks,
      'paymentStatus': instance.paymentStatus,
    };
