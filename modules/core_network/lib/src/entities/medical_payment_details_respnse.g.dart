// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_payment_details_respnse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalPaymentResponse _$MedicalPaymentResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalPaymentResponse(
      id: json['_id'] as String,
      file: json['file'] as String?,
      theNameOfTheHospital: json['theNameOfTheHospital'] as String?,
      documentName: json['documentName'] as String?,
      dateOfIssue: json['dateOfIssue'] == null
          ? null
          : DateTime.parse(json['dateOfIssue'] as String),
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$MedicalPaymentResponseToJson(
        MedicalPaymentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'file': instance.file,
      'theNameOfTheHospital': instance.theNameOfTheHospital,
      'documentName': instance.documentName,
      'dateOfIssue': instance.dateOfIssue?.toIso8601String(),
      'medicalRecord': instance.medicalRecord,
    };
