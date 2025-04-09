// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_hospital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordHospital _$MedicalRecordHospitalFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordHospital(
      id: json['_id'] as String,
      hospitalName: json['hospitalName'] as String?,
      hospitalId: json['hospitalId'] as String?,
      medicalCardNumber: json['medicalCardNumber'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordHospitalToJson(
        MedicalRecordHospital instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospitalName': instance.hospitalName,
      'hospitalId': instance.hospitalId,
      'medicalCardNumber': instance.medicalCardNumber,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
