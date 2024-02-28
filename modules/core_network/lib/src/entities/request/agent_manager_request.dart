import 'package:json_annotation/json_annotation.dart';

import 'agent_manager_contact_request.dart';

part 'agent_manager_request.g.dart';

@JsonSerializable()
class AgentManagerRequest {
  String? nameCardDragDrop;
  String? departmentName;
  String? fullNameRomanji;
  String? fullNameChineseKanjiVietnameseNotation;
  String? fullNameJapaneseKanjiChineseOnly;
  String? fullNameKana;
  String? phoneNumber;
  String? email;
  List<AgentManagerContactRequest>? contactMethods;
  String agentRecord;

  AgentManagerRequest({
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
  });

  factory AgentManagerRequest.fromJson(Map<String, dynamic> json) {
    return _$AgentManagerRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentManagerRequestToJson(this);
}
