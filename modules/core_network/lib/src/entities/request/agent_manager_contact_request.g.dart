// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_manager_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentManagerContactRequest _$AgentManagerContactRequestFromJson(
        Map<String, dynamic> json) =>
    AgentManagerContactRequest(
      id: json['_id'] as String?,
      howToContact: json['howToContact'] as String?,
      howToContactQrCode: json['howToContactQrCode'] as String?,
    );

Map<String, dynamic> _$AgentManagerContactRequestToJson(
        AgentManagerContactRequest instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'howToContact': instance.howToContact,
      'howToContactQrCode': instance.howToContactQrCode,
    };
