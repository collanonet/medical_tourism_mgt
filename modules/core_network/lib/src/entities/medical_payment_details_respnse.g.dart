// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_payment_details_respnse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalPaymentResponse _$MedicalPaymentResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalPaymentResponse(
      id: json['_id'] as String,
      uploadFile: json['uploadFile'] as String?,
      nameOfHospital: json['nameOfHospital'] as String?,
      documentName: json['documentName'] as String?,
      dataOfIssue: json['dataOfIssue'] == null
          ? null
          : DateTime.parse(json['dataOfIssue'] as String),
    );

Map<String, dynamic> _$MedicalPaymentResponseToJson(
        MedicalPaymentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uploadFile': instance.uploadFile,
      'nameOfHospital': instance.nameOfHospital,
      'documentName': instance.documentName,
      'dataOfIssue': instance.dataOfIssue?.toIso8601String(),
    };
