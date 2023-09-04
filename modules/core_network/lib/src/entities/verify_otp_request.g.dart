// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpRequest _$VerifyOtpRequestFromJson(Map<String, dynamic> json) =>
    VerifyOtpRequest(
      referenceData: json['referenceData'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$VerifyOtpRequestToJson(VerifyOtpRequest instance) =>
    <String, dynamic>{
      'referenceData': instance.referenceData,
      'code': instance.code,
    };
