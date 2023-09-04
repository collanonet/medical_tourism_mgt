// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_invitation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendInvitationResponse _$SendInvitationResponseFromJson(
        Map<String, dynamic> json) =>
    SendInvitationResponse(
      id: json['id'] as String,
      code: json['code'] as String,
      expiredIn: json['expiredIn'] as String?,
    );

Map<String, dynamic> _$SendInvitationResponseToJson(
        SendInvitationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'expiredIn': instance.expiredIn,
    };
