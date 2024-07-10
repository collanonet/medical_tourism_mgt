// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contrant_agent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContrantAgentResponse _$ContrantAgentResponseFromJson(
        Map<String, dynamic> json) =>
    ContrantAgentResponse(
      id: json['_id'] as String,
      uploadFile: json['uploadFile'] as String?,
      fileName: json['fileName'] as String?,
      uploadOn: json['uploadOn'] == null
          ? null
          : DateTime.parse(json['uploadOn'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ContrantAgentResponseToJson(
        ContrantAgentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uploadFile': instance.uploadFile,
      'fileName': instance.fileName,
      'uploadOn': instance.uploadOn?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
