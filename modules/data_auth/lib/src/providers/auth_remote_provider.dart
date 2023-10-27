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
  Future<AuthData> login(String email, String password) {
    return apiService.login(
      email,
      password,
    );
  }

  @override
  Future<void> clearStore() {
    throw UnimplementedError();
  }
}
