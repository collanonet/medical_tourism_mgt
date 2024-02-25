// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_booking_medical_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebBookingMedicalRecord _$WebBookingMedicalRecordFromJson(
        Map<String, dynamic> json) =>
    WebBookingMedicalRecord(
      id: json['_id'] as String,
      message: json['message'] as String?,
      medicalInstitutionName: json['medicalInstitutionName'] as String?,
      doctorName: json['doctorName'] as String?,
      candidateDate: (json['candidateDate'] as List<dynamic>)
          .map((e) => BookingDateResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      testCallDate: json['testCallDate'] == null
          ? null
          : DateTime.parse(json['testCallDate'] as String),
      testCallTime: json['testCallTime'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WebBookingMedicalRecordToJson(
        WebBookingMedicalRecord instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'message': instance.message,
      'medicalInstitutionName': instance.medicalInstitutionName,
      'doctorName': instance.doctorName,
      'candidateDate': instance.candidateDate,
      'testCallDate': instance.testCallDate?.toIso8601String(),
      'testCallTime': instance.testCallTime,
      'medicalRecord': instance.medicalRecord,
      'patient': instance.patient,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
