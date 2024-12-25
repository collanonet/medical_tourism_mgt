// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingResponse _$BillingResponseFromJson(Map<String, dynamic> json) =>
    BillingResponse(
      id: json['_id'] as String,
      deposit: (json['deposit'] as num?)?.toDouble(),
      settlementFee: (json['settlementFee'] as num?)?.toDouble(),
      balance: (json['balance'] as num?)?.toDouble(),
      treatmentCost: (json['treatmentCost'] as List<dynamic>?)
          ?.map(
              (e) => TreatmentCostResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      remarks: json['remarks'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$BillingResponseToJson(BillingResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'deposit': instance.deposit,
      'settlementFee': instance.settlementFee,
      'balance': instance.balance,
      'treatmentCost': instance.treatmentCost,
      'remarks': instance.remarks,
      'medicalRecord': instance.medicalRecord,
    };

TreatmentCostResponse _$TreatmentCostResponseFromJson(
        Map<String, dynamic> json) =>
    TreatmentCostResponse(
      id: json['_id'] as String,
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
      '_id': instance.id,
      'occurrenceDate': instance.occurrenceDate?.toIso8601String(),
      'hospitalName': instance.hospitalName,
      'treatmentDetails': instance.treatmentDetails,
      'amount': instance.amount,
      'remainingAmount': instance.remainingAmount,
      'file': instance.file,
    };
