// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expireIn: json['expireIn'] as int,
      deviceId: json['deviceId'] as String?,
      referenceData: json['referenceData'] as String?,
      isTrustedDevice: json['isTrustedDevice'] as bool? ?? false,
    );

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expireIn': instance.expireIn,
      'deviceId': instance.deviceId,
      'referenceData': instance.referenceData,
      'isTrustedDevice': instance.isTrustedDevice,
    };
