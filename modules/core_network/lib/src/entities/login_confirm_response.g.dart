// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_confirm_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginConfirmResponse _$LoginConfirmResponseFromJson(
        Map<String, dynamic> json) =>
    LoginConfirmResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expireIn: json['expireIn'] as int,
      requiredPinChange: json['requiredPinChange'] as bool,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$LoginConfirmResponseToJson(
        LoginConfirmResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expireIn': instance.expireIn,
      'requiredPinChange': instance.requiredPinChange,
      'deviceId': instance.deviceId,
    };
