// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_auth/data_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthModel extends ChangeNotifier {
  AuthModel({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  PermissionRole _userRole = PermissionRole.guest;

  PermissionRole get userRole => _userRole;

  User? get user => _user;
  User? _user;

  Future<void> initialize() async {
    logger.d('auth initialize');
    try {
      _userRole = await authRepository.getPermissionRole();
      _user = await authRepository.getUser();
      notifyListeners();
    } catch (e) {
      _userRole = PermissionRole.guest;
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
      syncAuthState();
    } catch (error) {
      logger.d(error);
      _loginData = AsyncData(error: error);
      notifyListeners();
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
