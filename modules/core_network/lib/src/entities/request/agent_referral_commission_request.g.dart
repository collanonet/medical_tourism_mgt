// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_referral_commission_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentReferralCommissionRequest _$AgentReferralCommissionRequestFromJson(
        Map<String, dynamic> json) =>
    AgentReferralCommissionRequest(
      id: json['_id'] as String?,
      referralCommissionName: json['referralCommissionName'] as String?,
      referralCommission: (json['referralCommission'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AgentReferralCommissionRequestToJson(
        AgentReferralCommissionRequest instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'referralCommissionName': instance.referralCommissionName,
      'referralCommission': instance.referralCommission,
    };
