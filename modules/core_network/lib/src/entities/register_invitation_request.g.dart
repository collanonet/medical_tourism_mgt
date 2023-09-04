// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_invitation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterInvitationRequest _$RegisterInvitationRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterInvitationRequest(
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      digitCode: json['digitCode'] as String,
      nationalId: json['nationalId'] as String?,
    );

Map<String, dynamic> _$RegisterInvitationRequestToJson(
        RegisterInvitationRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'digitCode': instance.digitCode,
      'nationalId': instance.nationalId,
    };
