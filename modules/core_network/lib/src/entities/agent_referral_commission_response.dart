// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'agent_referral_commission_response.g.dart';

@JsonSerializable()
class AgentReferralCommissionResponse {
  @JsonKey(name: '_id')
  final String id;
  String? referralCommissionName;
  int? referralCommission;
  final DateTime createdAt;
  final DateTime updatedAt;


  AgentReferralCommissionResponse({
    required this.id,
    this.referralCommissionName,
    this.referralCommission,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AgentReferralCommissionResponse.fromJson(Map<String, dynamic> json) {
    return _$AgentReferralCommissionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$AgentReferralCommissionResponseToJson(this);
}
