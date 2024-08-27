// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_head_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeadInfoRequest _$HeadInfoRequestFromJson(Map<String, dynamic> json) =>
    HeadInfoRequest(
      medicalExpenseDeposit: json['medicalExpenseDeposit'] as int?,
      paymentDay: json['paymentDay'] == null
          ? null
          : DateTime.parse(json['paymentDay'] as String),
      actualCost: json['actualCost'] as int?,
      settlementDay: json['settlementDay'] == null
          ? null
          : DateTime.parse(json['settlementDay'] as String),
      actualCostBreakdown: json['actualCostBreakdown'] as String?,
      refundAmount: json['refundAmount'] as int?,
    );

Map<String, dynamic> _$HeadInfoRequestToJson(HeadInfoRequest instance) =>
    <String, dynamic>{
      'medicalExpenseDeposit': instance.medicalExpenseDeposit,
      'paymentDay': instance.paymentDay?.toIso8601String(),
      'actualCost': instance.actualCost,
      'settlementDay': instance.settlementDay?.toIso8601String(),
      'actualCostBreakdown': instance.actualCostBreakdown,
      'refundAmount': instance.refundAmount,
    };
