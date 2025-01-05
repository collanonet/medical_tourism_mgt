// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'agent_referral_commission_request.g.dart';

@JsonSerializable()
class AgentReferralCommissionRequest {
  @JsonKey(name: '_id')
  String? id;
  String? referralCommissionName;
  int? referralCommission;

  AgentReferralCommissionRequest({
    this.id,
    this.referralCommissionName,
    this.referralCommission,
  });


  factory AgentReferralCommissionRequest.fromJson(Map<String, dynamic> json) {
    return _$AgentReferralCommissionRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentReferralCommissionRequestToJson(this);
}
