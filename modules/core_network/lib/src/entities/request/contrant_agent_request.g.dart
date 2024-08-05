// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contrant_agent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContrantAgentRequest _$ContrantAgentRequestFromJson(
        Map<String, dynamic> json) =>
    ContrantAgentRequest(
      uploadFile: json['uploadFile'] as String?,
      fileName: json['fileName'] as String?,
      uploadOn: json['uploadOn'] == null
          ? null
          : DateTime.parse(json['uploadOn'] as String),
      agentRecord: json['agentRecord'] as String,
    );

Map<String, dynamic> _$ContrantAgentRequestToJson(
        ContrantAgentRequest instance) =>
    <String, dynamic>{
      'uploadFile': instance.uploadFile,
      'fileName': instance.fileName,
      'uploadOn': instance.uploadOn?.toIso8601String(),
      'agentRecord': instance.agentRecord,
    };
