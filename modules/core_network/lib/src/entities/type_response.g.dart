// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeResponse _$TypeResponseFromJson(Map<String, dynamic> json) => TypeResponse(
      id: json['_id'] as String,
      typeName: json['typeName'] as String,
      color: json['color'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TypeResponseToJson(TypeResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'typeName': instance.typeName,
      'color': instance.color,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
