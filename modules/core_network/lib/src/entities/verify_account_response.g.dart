// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyAccountResponse _$VerifyAccountResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyAccountResponse(
      success: json['success'] as bool,
      account: BankAccount.fromJson(json['account'] as Map<String, dynamic>),
      referenceData: json['referenceData'] as String,
    );

Map<String, dynamic> _$VerifyAccountResponseToJson(
        VerifyAccountResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'account': instance.account,
      'referenceData': instance.referenceData,
    };
