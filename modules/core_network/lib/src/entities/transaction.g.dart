// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      tip: (json['tip'] as num).toDouble(),
      paymentType: json['paymentType'] as String,
      payerName: json['payerName'] as String,
      payerBankAccountNumber: json['payerBankAccountNumber'] as String,
      payerBank: json['payerBank'] as String,
      date: json['date'] as String,
      transactionId: json['transactionId'] as String,
      transactionHash: json['transactionHash'] as String,
      transactionRef: json['transactionRef'] as String,
      status:
          $enumDecode(_$TransactionStatusEnumMap, json['transactionStatus']),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'tip': instance.tip,
      'paymentType': instance.paymentType,
      'payerName': instance.payerName,
      'payerBankAccountNumber': instance.payerBankAccountNumber,
      'payerBank': instance.payerBank,
      'date': instance.date,
      'transactionId': instance.transactionId,
      'transactionHash': instance.transactionHash,
      'transactionRef': instance.transactionRef,
      'transactionStatus': _$TransactionStatusEnumMap[instance.status]!,
    };

const _$TransactionStatusEnumMap = {
  TransactionStatus.tipped: 'TIPPED',
  TransactionStatus.failed: 'FAILED',
  TransactionStatus.refund: 'REFUND',
  TransactionStatus.pending: 'PENDING',
  TransactionStatus.success: 'SUCCESS',
  TransactionStatus.settled: 'SETTLED',
};
