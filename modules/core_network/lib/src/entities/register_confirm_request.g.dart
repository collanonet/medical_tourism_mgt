// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_confirm_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterConfirmRequest _$RegisterConfirmRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterConfirmRequest(
      referenceData: json['referenceData'] as String,
      code: json['code'] as String,
      pin: json['pin'] as String,
    );

Map<String, dynamic> _$RegisterConfirmRequestToJson(
        RegisterConfirmRequest instance) =>
    <String, dynamic>{
      'referenceData': instance.referenceData,
      'code': instance.code,
      'pin': instance.pin,
    };
