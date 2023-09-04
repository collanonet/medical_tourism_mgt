import 'package:json_annotation/json_annotation.dart';

import 'bank_account.dart';
import 'khqr_status.dart';
import 'transaction.dart';

part 'khqr_details.g.dart';

@JsonSerializable()
class KhqrDetails {
  const KhqrDetails({
    required this.id,
    required this.content,
    required this.expireAt,
    required this.status,
    this.transaction,
    required this.bankAccount,
  });

  final String id;
  final String content;
  final int expireAt;
  final KhqrStatus status;
  final Transaction? transaction;
  final BankAccount bankAccount;

  factory KhqrDetails.fromJson(Map<String, dynamic> json) {
    return _$KhqrDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$KhqrDetailsToJson(this);
  }
}
