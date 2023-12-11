// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_nationality_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientNationalityRequest _$PatientNationalityRequestFromJson(
        Map<String, dynamic> json) =>
    PatientNationalityRequest(
      nationality: json['nationality'] as String?,
      nativeLanguage: json['nativeLanguage'] as String?,
      residentialArea: json['residentialArea'] as String?,
      currentAddress: json['currentAddress'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      patient: json['patient'] as String?,
    );

Map<String, dynamic> _$PatientNationalityRequestToJson(
        PatientNationalityRequest instance) =>
    <String, dynamic>{
      'nationality': instance.nationality,
      'nativeLanguage': instance.nativeLanguage,
      'residentialArea': instance.residentialArea,
      'currentAddress': instance.currentAddress,
      'mobileNumber': instance.mobileNumber,
      'patient': instance.patient,
    };
