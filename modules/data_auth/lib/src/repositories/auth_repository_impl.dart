import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';
import 'package:core_network/entities.dart';
import '../entities/index.dart';
import '../exceptions/expired_token_exception.dart';
import '../providers/auth_provider.dart';
import 'auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    @Named('localAuth') required this.local,
    @Named('remoteAuth') required this.remote,
  });

  final AuthProvider local;
  final AuthProvider remote;

  @override
  Future<String?> getAccessToken() {
    return local.getAccessToken();
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await local.getAccessToken();
    return token != null;
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
  Future<AuthData> login(String email, String password) async {
    final response = await remote.login(email, password);

    await local.handleAuthResponse(
      AuthResponse(
        credentials: Credentials(
          refreshToken: response.refreshToken,
          accessToken: response.accessToken,
        ),
        role: response.user.role,
      ),
    );
    return response;
  }

  @override
  Future<void> logOut() {
    return local.clearStore();
  }
}
