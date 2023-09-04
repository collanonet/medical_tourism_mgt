import 'package:json_annotation/json_annotation.dart';

import 'credentials.dart';
import 'permission_role.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  const AuthResponse({
    required this.credentials,
    required this.role,
  });

  final Credentials credentials;
  final PermissionRole role;

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthResponseToJson(this);
  }
}
