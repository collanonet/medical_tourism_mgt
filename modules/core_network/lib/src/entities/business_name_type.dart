import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum BusinessNameType {
  @JsonValue('OFFICIAL_NAME')
  officeName,

  @JsonValue('PREFERRED_NAME')
  preferredName,

  @JsonValue('SETTLEMENT_ACCOUNT_NAME')
  settlementAccountName,
}