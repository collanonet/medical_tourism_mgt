// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_manager_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentManagerRequest _$AgentManagerRequestFromJson(Map<String, dynamic> json) =>
    AgentManagerRequest(
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
              AgentManagerContactRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      agentRecord: json['agentRecord'] as String,
    );

Map<String, dynamic> _$AgentManagerRequestToJson(
        AgentManagerRequest instance) =>
    <String, dynamic>{
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
    };
