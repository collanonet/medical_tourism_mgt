// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      referenceData: json['referenceData'] as String,
      success: json['success'] as bool,
      expireIn: json['expireIn'] as int,
      requiredPinChange: json['requiredPinChange'] as bool,
      isTrustedDevice: json['isTrustedDevice'] as bool,
      deviceId: json['deviceId'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'referenceData': instance.referenceData,
      'success': instance.success,
      'expireIn': instance.expireIn,
      'requiredPinChange': instance.requiredPinChange,
      'isTrustedDevice': instance.isTrustedDevice,
      'deviceId': instance.deviceId,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
