import 'package:json_annotation/json_annotation.dart';

enum PermissionRole {
  @JsonValue('ROLE_GUEST')
  guest,
  @JsonValue('ROLE_USER')
  user
}
