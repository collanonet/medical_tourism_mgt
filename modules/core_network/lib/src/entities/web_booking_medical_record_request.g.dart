// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_booking_medical_record_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebBookingMedicalRecordRequest _$WebBookingMedicalRecordRequestFromJson(
        Map<String, dynamic> json) =>
    WebBookingMedicalRecordRequest(
      message: json['message'] as String?,
      medicalInstitutionName: json['medicalInstitutionName'] as String?,
      doctorName: json['doctorName'] as String?,
      candidateDate: (json['candidateDate'] as List<dynamic>)
          .map((e) => BookingDateRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      medicalRecord: json['medicalRecord'] as String,
      testCallDate: json['testCallDate'] as String,
      testCallTime: json['testCallTime'] as String,
      patient: json['patient'] as String,
    );

Map<String, dynamic> _$WebBookingMedicalRecordRequestToJson(
        WebBookingMedicalRecordRequest instance) =>
    <String, dynamic>{
      'message': instance.message,
      'medicalInstitutionName': instance.medicalInstitutionName,
      'doctorName': instance.doctorName,
      'candidateDate': instance.candidateDate,
      'medicalRecord': instance.medicalRecord,
      'testCallDate': instance.testCallDate,
      'testCallTime': instance.testCallTime,
      'patient': instance.patient,
    };
