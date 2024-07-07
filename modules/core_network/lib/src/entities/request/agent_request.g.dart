// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentRequest _$AgentRequestFromJson(Map<String, dynamic> json) => AgentRequest(
      memo: json['memo'] as String?,
      companyName: json['companyName'] as String?,
      nameKana: json['nameKana'] as String?,
      postalCode: json['postalCode'] as String?,
      address: json['address'] as String?,
      area: json['area'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      transactionStartDate: json['transactionStartDate'] == null
          ? null
          : DateTime.parse(json['transactionStartDate'] as String),
      howToMainPayment: json['howToMainPayment'] as String?,
      pastCasesNumber: (json['pastCasesNumber'] as num?)?.toInt(),
      referralCommissions: (json['referralCommissions'] as List<dynamic>?)
          ?.map((e) => AgentReferralCommissionRequest.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgentRequestToJson(AgentRequest instance) =>
    <String, dynamic>{
      'memo': instance.memo,
      'companyName': instance.companyName,
      'nameKana': instance.nameKana,
      'postalCode': instance.postalCode,
      'address': instance.address,
      'area': instance.area,
      'phoneNumber': instance.phoneNumber,
      'transactionStartDate': instance.transactionStartDate?.toIso8601String(),
      'howToMainPayment': instance.howToMainPayment,
      'pastCasesNumber': instance.pastCasesNumber,
      'referralCommissions': instance.referralCommissions,
    };
