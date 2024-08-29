// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_payment_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalPaymentRequest _$MedicalPaymentRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalPaymentRequest(
      file: json['file'] as String?,
      theNameOfTheHospital: json['theNameOfTheHospital'] as String?,
      documentName: json['documentName'] as String?,
      dateOfIssue: json['dateOfIssue'] == null
          ? null
          : DateTime.parse(json['dateOfIssue'] as String),
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$MedicalPaymentRequestToJson(
        MedicalPaymentRequest instance) =>
    <String, dynamic>{
      'file': instance.file,
      'theNameOfTheHospital': instance.theNameOfTheHospital,
      'documentName': instance.documentName,
      'dateOfIssue': instance.dateOfIssue?.toIso8601String(),
      'medicalRecord': instance.medicalRecord,
    };
