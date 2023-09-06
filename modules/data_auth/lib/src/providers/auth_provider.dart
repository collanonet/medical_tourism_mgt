import 'package:core_network/core_network.dart';

import '../entities/index.dart';

abstract class AuthProvider {
  Future<String?> getReferenceData();

  void setReferenceData(String value);

  void setHasLegacy(bool value);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<String?> getDeviceId();

  void setDeviceId(String value);

  Future<PermissionRole?> getPermissionRole();

  Future<Credentials> refreshToken(String token);

  Future<void> handleAuthResponse(AuthResponse response);

  Future<AuthData> login(String username, String password);

  Future<void> clearStore();

  Future<bool> isFreshInstall();

  Future<void> updateFreshInstall();

}
