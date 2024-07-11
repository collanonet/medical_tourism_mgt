// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_payment_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalPaymentRequest _$MedicalPaymentRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalPaymentRequest(
      uploadFile: json['uploadFile'] as String?,
      nameOfHospital: json['nameOfHospital'] as String?,
      documentName: json['documentName'] as String?,
      dataOfIssue: json['dataOfIssue'] == null
          ? null
          : DateTime.parse(json['dataOfIssue'] as String),
    );

Map<String, dynamic> _$MedicalPaymentRequestToJson(
        MedicalPaymentRequest instance) =>
    <String, dynamic>{
      'uploadFile': instance.uploadFile,
      'nameOfHospital': instance.nameOfHospital,
      'documentName': instance.documentName,
      'dataOfIssue': instance.dataOfIssue?.toIso8601String(),
    };
