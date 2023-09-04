import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';

import '../entities/index.dart';

abstract class AuthRepository {
  Future<String?> getAccessToken();

  Future<String?> getDeviceId();

  Future<String?> getReferenceData();

  Future<Credentials> refreshToken();

  Future<PermissionRole> getPermissionRole();

  Future<AuthData> signIn(String username, String password);

  Future<void> signOut();

  Future<bool> isFreshInstall();
}
