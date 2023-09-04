// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_invitation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendInvitationRequest _$SendInvitationRequestFromJson(
        Map<String, dynamic> json) =>
    SendInvitationRequest(
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      nationalId: json['nationalId'] as String?,
    );

Map<String, dynamic> _$SendInvitationRequestToJson(
        SendInvitationRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'fullName': instance.fullName,
      'nationalId': instance.nationalId,
    };
