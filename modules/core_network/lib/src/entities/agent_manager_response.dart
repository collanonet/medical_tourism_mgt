import 'package:json_annotation/json_annotation.dart';

import 'agent_manager_contact_response.dart';

part 'agent_manager_response.g.dart';

@JsonSerializable()
class AgentManagerResponse {
  @JsonKey(name: '_id')
  final String id;
  String? nameCardDragDrop;
  String? departmentName;
  String? fullNameRomanji;
  String? fullNameChineseKanjiVietnameseNotation;
  String? fullNameJapaneseKanjiChineseOnly;
  String? fullNameKana;
  String? phoneNumber;
  String? email;
  List<AgentManagerContactResponse>? contactMethods;
  String agentRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  AgentManagerResponse({
    required this.id,
    this.nameCardDragDrop,
    this.departmentName,
    this.fullNameRomanji,
    this.fullNameChineseKanjiVietnameseNotation,
    this.fullNameJapaneseKanjiChineseOnly,
    this.fullNameKana,
    this.phoneNumber,
    this.email,
    this.contactMethods,
    required this.agentRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AgentManagerResponse.fromJson(Map<String, dynamic> json) {
    return _$AgentManagerResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentManagerResponseToJson(this);
}
