import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum KhqrStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('PAID')
  paid,
  @JsonValue('UNPUBLISHED')
  unpublished
}
