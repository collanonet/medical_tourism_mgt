// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_invitation_confirm_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterInvitationConfirmRequest _$RegisterInvitationConfirmRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterInvitationConfirmRequest(
      referenceData: json['referenceData'] as String,
      code: json['code'] as String,
      pin: json['pin'] as String,
    );

Map<String, dynamic> _$RegisterInvitationConfirmRequestToJson(
        RegisterInvitationConfirmRequest instance) =>
    <String, dynamic>{
      'referenceData': instance.referenceData,
      'code': instance.code,
      'pin': instance.pin,
    };
