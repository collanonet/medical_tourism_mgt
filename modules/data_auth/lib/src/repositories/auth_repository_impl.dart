import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

import '../entities/index.dart';
import '../exceptions/expired_token_exception.dart';
import '../providers/auth_provider.dart';
import 'auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    @Named('localAuthz') required this.local,
    @Named('remoteAuthz') required this.remote,
  });

  final AuthProvider local;
  final AuthProvider remote;

  @override
  Future<String?> getAccessToken() {
    return local.getAccessToken();
  }

  @override
  Future<String?> getDeviceId() {
    return local.getDeviceId();
  }

  @override
  Future<String?> getReferenceData() {
    return local.getReferenceData();
  }

  @override
  Future<Credentials> refreshToken() async {
    try {
      final token = await local.getRefreshToken();
      if (token == null) throw ExpiredTokenException();

      return remote.refreshToken(token);
    } catch (e) {
      throw ExpiredTokenException();
    }
  }

  @override
  Future<PermissionRole> getPermissionRole() async {
    return await local.getPermissionRole() ?? PermissionRole.guest;
  }

  @override
  Future<AuthData> signIn(String username, String password) async {
    final currentDeviceId = await local.getDeviceId() ?? '';
    final response = await remote.login(username, password);
    var trusted = response.isTrustedDevice;
    var deviceId = response.deviceId;
    if (deviceId != null) {
      local.setDeviceId(deviceId);
    }
    await local.handleAuthResponse(AuthResponse(
      credentials: Credentials(
        refreshToken: response.refreshToken,
        accessToken: response.accessToken,
      ),
      role: trusted ? PermissionRole.user : PermissionRole.guest,
    ));
    await local.updateFreshInstall();
    return response;
  }

  @override
  Future<void> signOut() {
    return local.clearStore();
  }

  @override
  Future<bool> isFreshInstall() => local.isFreshInstall();
}
