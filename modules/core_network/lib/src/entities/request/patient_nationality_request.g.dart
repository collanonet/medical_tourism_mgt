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
      email: json['email'] as String?,
      chatToolLink: (json['chatToolLink'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      chatQr:
          (json['chatQr'] as List<dynamic>?)?.map((e) => e as String?).toList(),
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
      'email': instance.email,
      'chatToolLink': instance.chatToolLink,
      'chatQr': instance.chatQr,
      'patient': instance.patient,
    };
