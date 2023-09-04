// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => BankAccount(
      bankAccountNumber: json['bankAccountNumber'] as String,
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
      bankAccountHolderName: json['bankAccountHolderName'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'bankAccountNumber': instance.bankAccountNumber,
      'bankAccountHolderName': instance.bankAccountHolderName,
      'status': instance.status,
    };

const _$CurrencyEnumMap = {
  Currency.usd: 'USD',
  Currency.khr: 'KHR',
};

BankAccountCompact _$BankAccountCompactFromJson(Map<String, dynamic> json) =>
    BankAccountCompact(
      id: json['id'] as String,
      bankAccountNumber: json['bankAccountNumber'] as String,
      bankAccountHolderName: json['bankAccountHolderName'] as String?,
      status: json['status'] as String?,
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
    );

Map<String, dynamic> _$BankAccountCompactToJson(BankAccountCompact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankAccountNumber': instance.bankAccountNumber,
      'bankAccountHolderName': instance.bankAccountHolderName,
      'status': instance.status,
      'currency': _$CurrencyEnumMap[instance.currency]!,
    };
