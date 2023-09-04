// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_confirm_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginConfirmRequest _$LoginConfirmRequestFromJson(Map<String, dynamic> json) =>
    LoginConfirmRequest(
      referenceData: json['referenceData'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$LoginConfirmRequestToJson(
        LoginConfirmRequest instance) =>
    <String, dynamic>{
      'referenceData': instance.referenceData,
      'code': instance.code,
    };
