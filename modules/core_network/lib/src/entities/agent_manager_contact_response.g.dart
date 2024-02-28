// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_manager_contact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentManagerContactResponse _$AgentManagerContactResponseFromJson(
        Map<String, dynamic> json) =>
    AgentManagerContactResponse(
      id: json['_id'] as String,
      howToContact: json['howToContact'] as String?,
      howToContactQrCode: json['howToContactQrCode'] as String?,
    );

Map<String, dynamic> _$AgentManagerContactResponseToJson(
        AgentManagerContactResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'howToContact': instance.howToContact,
      'howToContactQrCode': instance.howToContactQrCode,
    };
