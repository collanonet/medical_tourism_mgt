
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_auth/data_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthModel extends ChangeNotifier {
  AuthModel({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  PermissionRole _userRole = PermissionRole.guest;

  PermissionRole get userRole => _userRole;

  Future<void> initialize() async {
    logger.d('auth initialize');
    try {
      _userRole = await authRepository.getPermissionRole();
    } catch (e) {
      _userRole = PermissionRole.guest;
    } finally {
      notifyListeners();
    }
  }

  Future<void> syncAuthState() async {
    try {
      _userRole = await authRepository.getPermissionRole();
    } catch (e) {
      _userRole = PermissionRole.guest;
    } finally {
      notifyListeners();
    }
  }

  set userRole(PermissionRole role) {
    _userRole = role;
    notifyListeners();
  }

  AsyncData<AuthData> _loginData = const AsyncData<AuthData>();
  AsyncData<AuthData> get loginData => _loginData;

  Future<void> logIn(String email, String password) async {
    _loginData = const AsyncData(loading: true);
    notifyListeners();

    try {
      var result = await authRepository.login(email, password);
      _loginData = AsyncData(data: result);
    } catch (error) {
      logger.d(error);
      _loginData = AsyncData(error: error);
    } finally {
      notifyListeners();
      syncAuthState();
    }
  }

  void logOut() async {
    try {
      await authRepository.logOut();
    } catch (e) {
      // no op
    } finally {
      _userRole = PermissionRole.guest;
      notifyListeners();
    }
  }
}
