// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_hospital_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordHospitalRequest _$MedicalRecordHospitalRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordHospitalRequest(
      hospitalName: json['hospitalName'] as String?,
      medicalCardNumber: json['medicalCardNumber'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$MedicalRecordHospitalRequestToJson(
        MedicalRecordHospitalRequest instance) =>
    <String, dynamic>{
      'hospitalName': instance.hospitalName,
      'medicalCardNumber': instance.medicalCardNumber,
      'medicalRecord': instance.medicalRecord,
    };
