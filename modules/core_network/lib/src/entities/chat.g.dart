// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      id: json['_id'] as String,
      name: json['name'] as String?,
      isGroupChat: json['isGroupChat'] as bool,
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestMessage: json['latestMessage'] == null
          ? null
          : Message.fromJson(json['latestMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'isGroupChat': instance.isGroupChat,
      'users': instance.users,
      'latestMessage': instance.latestMessage,
    };
