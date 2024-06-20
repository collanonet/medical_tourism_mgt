import 'package:json_annotation/json_annotation.dart';

import 'agent_referral_commission_request.dart';

part 'agent_request.g.dart';

@JsonSerializable()
class AgentRequest {
  String? memo;
  String? manager;
  String? companyName;
  String? nameKana;
  String? postalCode;
  String? address;
  String? area;
  String? phoneNumber;
  DateTime? transactionStartDate;
  String? howToMainPayment;
  int? pastCasesNumber;
  List<AgentReferralCommissionRequest>? referralCommissions;

  AgentRequest({
    this.manager,
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
  });

  factory AgentRequest.fromJson(Map<String, dynamic> json) {
    return _$AgentRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentRequestToJson(this);
}