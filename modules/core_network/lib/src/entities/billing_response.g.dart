// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingResponse _$BillingResponseFromJson(Map<String, dynamic> json) =>
    BillingResponse(
      deposit: (json['deposit'] as num?)?.toDouble(),
      settlementFee: (json['settlementFee'] as num?)?.toDouble(),
      balance: (json['balance'] as num?)?.toDouble(),
      treatmentCost: (json['treatmentCost'] as List<dynamic>?)
          ?.map(
              (e) => TreatmentCostResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$BillingResponseToJson(BillingResponse instance) =>
    <String, dynamic>{
      'deposit': instance.deposit,
      'settlementFee': instance.settlementFee,
      'balance': instance.balance,
      'treatmentCost': instance.treatmentCost,
      'remarks': instance.remarks,
    };

TreatmentCostResponse _$TreatmentCostResponseFromJson(
        Map<String, dynamic> json) =>
    TreatmentCostResponse(
      occurrenceDate: json['occurrenceDate'] == null
          ? null
          : DateTime.parse(json['occurrenceDate'] as String),
      hospitalName: json['hospitalName'] as String?,
      treatmentDetails: json['treatmentDetails'] as String?,
      amount: json['amount'] as String?,
      remainingAmount: json['remainingAmount'] as String?,
      file: json['file'] as String?,
    );

Map<String, dynamic> _$TreatmentCostResponseToJson(
        TreatmentCostResponse instance) =>
    <String, dynamic>{
      'occurrenceDate': instance.occurrenceDate?.toIso8601String(),
      'hospitalName': instance.hospitalName,
      'treatmentDetails': instance.treatmentDetails,
      'amount': instance.amount,
      'remainingAmount': instance.remainingAmount,
      'file': instance.file,
    };
