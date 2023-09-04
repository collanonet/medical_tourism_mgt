import 'package:json_annotation/json_annotation.dart';

enum InvitationRole {
  @JsonValue('OWNER')
  owner,
  @JsonValue('CO_MERCHANT')
  coMerchant,
  @JsonValue('SUPERVISOR')
  supervisor,
  @JsonValue('CASHIER')
  cashier
}
