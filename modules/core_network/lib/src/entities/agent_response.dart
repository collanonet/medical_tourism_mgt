// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../core_network.dart';

part 'agent_response.g.dart';

@JsonSerializable()
class AgentResponse {
  @JsonKey(name: '_id')
  final String id;
  String? memo;
  String? companyName;
  String? nameKana;
  String? postalCode;
  String? address;
  String? area;
  String? phoneNumber;
  DateTime? transactionStartDate;
  String? howToMainPayment;
  int? pastCasesNumber;
  List<AgentReferralCommissionResponse>? referralCommissions;
  AgentManager? manager;
  final DateTime createdAt;
  final DateTime updatedAt;

  AgentResponse({
    required this.id,
    this.memo,
    this.companyName,
    this.nameKana,
    this.postalCode,
    this.address,
    this.area,
    this.phoneNumber,
    this.transactionStartDate,
    this.howToMainPayment,
    this.pastCasesNumber,
    this.referralCommissions,
    this.manager,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AgentResponse.fromJson(Map<String, dynamic> json) {
    return _$AgentResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentResponseToJson(this);
}

@JsonSerializable()
class AgentManager {
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
  final DateTime createdAt;
  final DateTime updatedAt;

  AgentManager({
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory AgentManager.fromJson(Map<String, dynamic> json) {
    return _$AgentManagerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentManagerToJson(this);
}
