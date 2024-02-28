// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_manager_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentManagerResponse _$AgentManagerResponseFromJson(
        Map<String, dynamic> json) =>
    AgentManagerResponse(
      id: json['_id'] as String,
      nameCardDragDrop: json['nameCardDragDrop'] as String?,
      departmentName: json['departmentName'] as String?,
      fullNameRomanji: json['fullNameRomanji'] as String?,
      fullNameChineseKanjiVietnameseNotation:
          json['fullNameChineseKanjiVietnameseNotation'] as String?,
      fullNameJapaneseKanjiChineseOnly:
          json['fullNameJapaneseKanjiChineseOnly'] as String?,
      fullNameKana: json['fullNameKana'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      contactMethods: (json['contactMethods'] as List<dynamic>?)
          ?.map((e) =>
              AgentManagerContactResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      agentRecord: json['agentRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AgentManagerResponseToJson(
        AgentManagerResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nameCardDragDrop': instance.nameCardDragDrop,
      'departmentName': instance.departmentName,
      'fullNameRomanji': instance.fullNameRomanji,
      'fullNameChineseKanjiVietnameseNotation':
          instance.fullNameChineseKanjiVietnameseNotation,
      'fullNameJapaneseKanjiChineseOnly':
          instance.fullNameJapaneseKanjiChineseOnly,
      'fullNameKana': instance.fullNameKana,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'contactMethods': instance.contactMethods,
      'agentRecord': instance.agentRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
