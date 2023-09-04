import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:core_storage/core_storage.dart';
import 'package:injectable/injectable.dart';

import '../entities/index.dart';
import '../utils/permission_roles.dart';
import 'auth_provider.dart';

@Named('localAuthz')
@Injectable(as: AuthProvider)
class AuthLocalProvider extends AuthProvider {
  AuthLocalProvider({
    @Named('authzStorage') required this.storage,
  });

  final Storage storage;

  final _accessTokenStorageKey = 'access_token';
  final _refreshTokenStorageKey = 'refresh_token';
  final _permissionRoleStorageKey = 'permission_role';
  final _referenceData = 'reference_data';
  final _freshInstall = 'fresh_install';
  final _hasLegacy = 'has_legacy';
  final _deviceId = 'device_id';

  @override
  Future<String?> getReferenceData() {
    return storage.read(_referenceData);
  }

  @override
  void setReferenceData(String value) async {
    await storage.write(_referenceData, value);
  }

  @override
  void setHasLegacy(bool value) async {
    await storage.write(_hasLegacy, value ? '1' : '0');
  }

  @override
  Future<String?> getDeviceId() {
    return storage.read(_deviceId);
  }

  @override
  void setDeviceId(String value) async {
    await storage.write(_deviceId, value);
  }

  @override
  Future<String?> getAccessToken() {
    return storage.read(_accessTokenStorageKey);
  }

  @override
  Future<String?> getRefreshToken() {
    return storage.read(_refreshTokenStorageKey);
  }

  @override
  Future<PermissionRole?> getPermissionRole() async {
    return decodeRole(await storage.read(_permissionRoleStorageKey));
  }

  @override
  Future<void> handleAuthResponse(AuthResponse response) {
    final credentials = response.credentials;
    final role = response.role;

    return Future.wait([
      storage.write(_accessTokenStorageKey, credentials.accessToken),
      storage.write(_refreshTokenStorageKey, credentials.refreshToken),
      storage.write(_permissionRoleStorageKey, encodeRole(role)),
    ]);
  }

  @override
  Future<Credentials> refreshToken(String token) {
    throw UnimplementedError();
  }

  @override
  Future<AuthData> login(String username, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> clearStore() {
    return Future.wait([
      storage.write(_accessTokenStorageKey, null),
      storage.write(_refreshTokenStorageKey, null),
      storage.write(_permissionRoleStorageKey, null),
    ]);
  }

  @override
  Future<bool> isFreshInstall() {
    // TODO: implement isFreshInstall
    throw UnimplementedError();
  }

  @override
  Future<void> updateFreshInstall() {
    // TODO: implement updateFreshInstall
    throw UnimplementedError();
  }

}
