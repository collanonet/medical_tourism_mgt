// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    VerifyOtpResponse(
      referenceData: json['referenceData'] as String,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$VerifyOtpResponseToJson(VerifyOtpResponse instance) =>
    <String, dynamic>{
      'referenceData': instance.referenceData,
      'success': instance.success,
    };
