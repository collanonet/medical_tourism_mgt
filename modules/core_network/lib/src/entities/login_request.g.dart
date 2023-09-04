// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      phoneNumber: json['phoneNumber'] as String,
      pin: json['pin'] as String,
      deviceId: json['deviceId'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'pin': instance.pin,
      'deviceId': instance.deviceId,
    };
