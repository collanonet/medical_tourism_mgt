// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingRequest _$BillingRequestFromJson(Map<String, dynamic> json) =>
    BillingRequest(
      deposit: (json['deposit'] as num?)?.toDouble(),
      settlementFee: (json['settlementFee'] as num?)?.toDouble(),
      balance: (json['balance'] as num?)?.toDouble(),
      treatmentCost: (json['treatmentCost'] as List<dynamic>?)
          ?.map((e) => TreatmentCostRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$BillingRequestToJson(BillingRequest instance) =>
    <String, dynamic>{
      'deposit': instance.deposit,
      'settlementFee': instance.settlementFee,
      'balance': instance.balance,
      'treatmentCost': instance.treatmentCost,
      'remarks': instance.remarks,
    };

TreatmentCostRequest _$TreatmentCostRequestFromJson(
        Map<String, dynamic> json) =>
    TreatmentCostRequest(
      occurrenceDate: json['occurrenceDate'] == null
          ? null
          : DateTime.parse(json['occurrenceDate'] as String),
      hospitalName: json['hospitalName'] as String?,
      treatmentDetails: json['treatmentDetails'] as String?,
      amount: json['amount'] as String?,
      remainingAmount: json['remainingAmount'] as String?,
      file: json['file'] as String?,
    );

Map<String, dynamic> _$TreatmentCostRequestToJson(
        TreatmentCostRequest instance) =>
    <String, dynamic>{
      'occurrenceDate': instance.occurrenceDate?.toIso8601String(),
      'hospitalName': instance.hospitalName,
      'treatmentDetails': instance.treatmentDetails,
      'amount': instance.amount,
      'remainingAmount': instance.remainingAmount,
      'file': instance.file,
    };
