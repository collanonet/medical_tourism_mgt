import 'package:core_network/core_network.dart';

import '../entities/index.dart';

abstract class AuthProvider {
  Future<String?> getReferenceData();

  void setReferenceData(String value);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<PermissionRole?> getPermissionRole();

  Future<Credentials> refreshToken(String token);

  Future<void> handleAuthResponse(AuthResponse response);

  Future<AuthData> login(String email, String password);

  Future<void> clearStore();
}
