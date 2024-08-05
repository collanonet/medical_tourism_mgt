// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_booking_medical_record_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebBookingMedicalRecordResponse _$WebBookingMedicalRecordResponseFromJson(
        Map<String, dynamic> json) =>
    WebBookingMedicalRecordResponse(
      id: json['_id'] as String,
      message: json['message'] as String?,
      medicalInstitutionName: json['medicalInstitutionName'] as String?,
      doctorName: json['doctorName'] as String?,
      candidateDate: (json['candidateDate'] as List<dynamic>)
          .map((e) => BookingDateResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      medicalRecord: json['medicalRecord'] as String,
      patient: json['patient'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WebBookingMedicalRecordResponseToJson(
        WebBookingMedicalRecordResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'message': instance.message,
      'medicalInstitutionName': instance.medicalInstitutionName,
      'doctorName': instance.doctorName,
      'candidateDate': instance.candidateDate,
      'medicalRecord': instance.medicalRecord,
      'patient': instance.patient,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
