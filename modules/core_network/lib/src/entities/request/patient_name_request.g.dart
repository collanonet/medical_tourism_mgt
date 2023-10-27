// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_name_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientNameRequest _$PatientNameRequestFromJson(Map<String, dynamic> json) =>
    PatientNameRequest(
      familyName: json['familyName'] as String?,
      middleName: json['middleName'] as String?,
      firstName: json['firstName'] as String?,
      nameType: json['nameType'] as String?,
      patient: json['patient'] as String?,
    );

Map<String, dynamic> _$PatientNameRequestToJson(PatientNameRequest instance) =>
    <String, dynamic>{
      'familyName': instance.familyName,
      'middleName': instance.middleName,
      'firstName': instance.firstName,
      'nameType': instance.nameType,
      'patient': instance.patient,
    };
