// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_referral_commission_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentReferralCommissionResponse _$AgentReferralCommissionResponseFromJson(
        Map<String, dynamic> json) =>
    AgentReferralCommissionResponse(
      id: json['_id'] as String,
      referralCommissionName: json['referralCommissionName'] as String?,
      referralCommission: json['referralCommission'] as int?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AgentReferralCommissionResponseToJson(
        AgentReferralCommissionResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'referralCommissionName': instance.referralCommissionName,
      'referralCommission': instance.referralCommission,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
