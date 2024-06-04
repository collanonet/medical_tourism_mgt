// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentResponse _$AgentResponseFromJson(Map<String, dynamic> json) =>
    AgentResponse(
      id: json['_id'] as String,
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
          ?.map((e) => AgentReferralCommissionResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      manager: json['manager'] == null
          ? null
          : AgentManagerResponse.fromJson(
              json['manager'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AgentResponseToJson(AgentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
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
      'manager': instance.manager,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
