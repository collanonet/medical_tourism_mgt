import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum TransactionStatus {
  @JsonValue('TIPPED')
  tipped,
  @JsonValue('FAILED')
  failed,
  @JsonValue('REFUND')
  refund,
  @JsonValue('PENDING')
  pending,
  @JsonValue('SUCCESS')
  success,
  @JsonValue('SETTLED')
  settled
}