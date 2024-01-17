import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import '../entities/index.dart';

abstract class AuthRepository {
  Future<String?> getAccessToken();

  Future<String?> getReferenceData();

  Future<bool> isLoggedIn();

  Future<Credentials> refreshToken();

  Future<PermissionRole> getPermissionRole();

  Future<AuthData> login(String email, String password);

  Future<void> logOut();
}
