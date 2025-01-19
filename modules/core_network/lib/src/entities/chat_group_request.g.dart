// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_group_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGroupRequest _$ChatGroupRequestFromJson(Map<String, dynamic> json) =>
    ChatGroupRequest(
      name: json['name'] as String,
      userIds:
          (json['userIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChatGroupRequestToJson(ChatGroupRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userIds': instance.userIds,
    };
