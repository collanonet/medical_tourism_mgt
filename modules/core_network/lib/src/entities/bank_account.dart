import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'currency.dart';
part 'bank_account.g.dart';

@JsonSerializable()
class BankAccount with EquatableMixin {
  BankAccount({
    required this.bankAccountNumber,
    required this.currency,
    required this.bankAccountHolderName,
    required this.status,
  });

  final Currency currency;
  final String bankAccountNumber;
  final String bankAccountHolderName;
  final String status;

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return _$BankAccountFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BankAccountToJson(this);

  @override
  List<Object?> get props => [bankAccountNumber];
}

@JsonSerializable()
class BankAccountCompact with EquatableMixin {
  const BankAccountCompact({
    required this.id,
    required this.bankAccountNumber,
    this.bankAccountHolderName,
    this.status,
    required this.currency,
  });

  final String id;
  final String bankAccountNumber;
  final String? bankAccountHolderName;
  final String? status;
  final Currency currency;

  factory BankAccountCompact.fromJson(Map<String, dynamic> json) {
    return _$BankAccountCompactFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BankAccountCompactToJson(this);

  @override
  List<Object?> get props => [id, bankAccountNumber];
}
