import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

import '../../data_auth.dart';
import 'auth_provider.dart';

@Named('remoteAuth')
@Injectable(as: AuthProvider)
class AuthRemoteProvider extends AuthProvider {
  AuthRemoteProvider({required this.apiService});

  final ApiService apiService;

  @override
  Future<String?> getReferenceData() {
    throw UnimplementedError();
  }

  @override
  void setReferenceData(String value) {
    throw UnimplementedError();
  }

  @override
  void setHasLegacy(bool value) {
    throw UnimplementedError();
  }

  @override
  Future<String?> getDeviceId() {
    throw UnimplementedError();
  }

  @override
  void setDeviceId(String value) {
    throw UnimplementedError();
  }

  @override
  Future<String?> getAccessToken() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getRefreshToken() {
    throw UnimplementedError();
  }

  @override
  Future<PermissionRole?> getPermissionRole() {
    throw UnimplementedError();
  }

  @override
  Future<void> handleAuthResponse(AuthResponse response) {
    throw UnimplementedError();
  }

  @override
  Future<Credentials> refreshToken(String token) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<AuthData> login(String username, String password) {
    return apiService
        .login(
          username,
          password,
        )
        .then(
          (value) => AuthData(
            accessToken: value.accessToken,
            refreshToken: value.refreshToken,
            expireIn: value.expireIn,
            isTrustedDevice: value.isTrustedDevice,
            referenceData: value.referenceData,
            deviceId: value.deviceId,
          ),
        );
  }

  @override
  Future<void> clearStore() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isFreshInstall() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateFreshInstall() {
    throw UnimplementedError();
  }
}
