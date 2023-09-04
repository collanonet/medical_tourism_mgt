import 'package:json_annotation/json_annotation.dart';

import 'bank_account.dart';

part 'verify_account_response.g.dart';

@JsonSerializable()
class VerifyAccountResponse {
  bool success;
  BankAccount account;
  String referenceData;

  VerifyAccountResponse({
    required this.success,
    required this.account,
    required this.referenceData,
  });

  factory VerifyAccountResponse.fromJson(Map<String, dynamic> json) {
    return _$VerifyAccountResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyAccountResponseToJson(this);
}
