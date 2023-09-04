import 'package:json_annotation/json_annotation.dart';

import 'transaction_status.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  const Transaction({
    required this.id,
    required this.amount,
    required this.tip,
    required this.paymentType,
    required this.payerName,
    required this.payerBankAccountNumber,
    required this.payerBank,
    required this.date,
    required this.transactionId,
    required this.transactionHash,
    required this.transactionRef,
    required this.status,
  });

  final String id;
  final double amount;
  final double tip;
  final String paymentType;
  final String payerName;
  final String payerBankAccountNumber;
  final String payerBank;
  final String date;
  final String transactionId;
  final String transactionHash;
  final String transactionRef;
  @JsonKey(name: 'transactionStatus')
  final TransactionStatus status;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return _$TransactionFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TransactionToJson(this);
  }
}
