import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum BusinessStatus {
  @JsonValue('UNVERIFIED')
  unverified
}
