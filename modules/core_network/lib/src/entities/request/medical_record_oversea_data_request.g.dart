// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_oversea_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordOverseaDataRequest _$MedicalRecordOverseaDataRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordOverseaDataRequest(
      file: json['file'] as String?,
      hospitalName: json['hospitalName'] as String?,
      category: json['category'] as String?,
      documentName: json['documentName'] as String?,
      issueDate: json['issueDate'] == null
          ? null
          : DateTime.parse(json['issueDate'] as String),
      sharedUrl: json['sharedUrl'] as String?,
      password: json['password'] as String?,
      qrCode: json['qrCode'] as String?,
      commentHospital1: json['commentHospital1'] as String?,
      commentOurCompany: json['commentOurCompany'] as String?,
      commentHospital2: json['commentHospital2'] as String?,
      expirationDate: json['expirationDate'] == null
          ? null
          : DateTime.parse(json['expirationDate'] as String),
      medicalRecord: json['medicalRecord'] as String,
    );

Map<String, dynamic> _$MedicalRecordOverseaDataRequestToJson(
        MedicalRecordOverseaDataRequest instance) =>
    <String, dynamic>{
      'file': instance.file,
      'hospitalName': instance.hospitalName,
      'category': instance.category,
      'documentName': instance.documentName,
      'sharedUrl': instance.sharedUrl,
      'password': instance.password,
      'qrCode': instance.qrCode,
      'commentHospital1': instance.commentHospital1,
      'commentOurCompany': instance.commentOurCompany,
      'commentHospital2': instance.commentHospital2,
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'issueDate': instance.issueDate?.toIso8601String(),
      'medicalRecord': instance.medicalRecord,
    };
