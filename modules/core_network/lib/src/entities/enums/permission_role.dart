import 'package:json_annotation/json_annotation.dart';

enum PermissionRole {
  @JsonValue('ROLE_GUEST')
  guest,
  @JsonValue('Admin')
  admin,
  @JsonValue('Hospital')
  hospital,
  @JsonValue('Agent')
  agent,
  @JsonValue('Patient')
  patient
}
