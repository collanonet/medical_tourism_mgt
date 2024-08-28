// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_storage/core_storage.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../entities/index.dart';
import '../utils/permission_roles.dart';
import 'auth_provider.dart';

@Named('localAuth')
@Injectable(as: AuthProvider)
class AuthLocalProvider extends AuthProvider {
  AuthLocalProvider({
    @Named('authStorage') required this.storage,
  });

  final Storage storage;

  final _accessTokenStorageKey = 'access_token';
  final _refreshTokenStorageKey = 'refresh_token';
  final _permissionRoleStorageKey = 'permission_role';
  final _referenceData = 'reference_data';

  @override
  Future<String?> getReferenceData() {
    return storage.read(_referenceData);
  }

  @override
  void setReferenceData(String value) async {
    await storage.write(_referenceData, value);
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
  Future<AuthData> login(String email, String password) {
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
}
