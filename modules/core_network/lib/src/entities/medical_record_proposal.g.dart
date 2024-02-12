// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_proposal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordProposal _$MedicalRecordProposalFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordProposal(
      id: json['_id'] as String,
      hospitalName: json['hospitalName'] as String?,
      postalCode: json['postalCode'] as String?,
      address: json['address'] as String?,
      summary: json['summary'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordProposalToJson(
        MedicalRecordProposal instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospitalName': instance.hospitalName,
      'postalCode': instance.postalCode,
      'address': instance.address,
      'summary': instance.summary,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
