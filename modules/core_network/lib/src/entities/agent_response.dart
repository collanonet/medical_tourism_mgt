import 'package:json_annotation/json_annotation.dart';

import 'agent_manager_response.dart';
import 'agent_referral_commission_response.dart';

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
  AgentManagerResponse? manager;
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
