// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_nationality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientNationality _$PatientNationalityFromJson(Map<String, dynamic> json) =>
    PatientNationality(
      id: json['_id'] as String,
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
      chatQrImage: json['chatQrImage'] as String?,
      patient: json['patient'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PatientNationalityToJson(PatientNationality instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nationality': instance.nationality,
      'nativeLanguage': instance.nativeLanguage,
      'residentialArea': instance.residentialArea,
      'currentAddress': instance.currentAddress,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'chatToolLink': instance.chatToolLink,
      'chatQr': instance.chatQr,
      'chatQrImage': instance.chatQrImage,
      'patient': instance.patient,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
