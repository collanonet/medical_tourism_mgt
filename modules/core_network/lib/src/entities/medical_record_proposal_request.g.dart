// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_proposal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordProposalRequest _$MedicalRecordProposalRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordProposalRequest(
      hospitalName: json['hospitalName'] as String?,
      postalCode: json['postalCode'] as String?,
      address: json['address'] as String?,
      summary: json['summary'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$MedicalRecordProposalRequestToJson(
        MedicalRecordProposalRequest instance) =>
    <String, dynamic>{
      'hospitalName': instance.hospitalName,
      'postalCode': instance.postalCode,
      'address': instance.address,
      'summary': instance.summary,
      'medicalRecord': instance.medicalRecord,
    };
