// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_manager_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentManagerContactRequest _$AgentManagerContactRequestFromJson(
        Map<String, dynamic> json) =>
    AgentManagerContactRequest(
      howToContact: json['howToContact'] as String?,
      howToContactQrCode: json['howToContactQrCode'] as String?,
    );

Map<String, dynamic> _$AgentManagerContactRequestToJson(
        AgentManagerContactRequest instance) =>
    <String, dynamic>{
      'howToContact': instance.howToContact,
      'howToContactQrCode': instance.howToContactQrCode,
    };
