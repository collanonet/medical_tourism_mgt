
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

  bool _isFreshInstall = true;

  String _deviceId = '';

  bool get isFreshInstall => _isFreshInstall;

  String get deviceId => _deviceId;

  Future<void> initialize() async {
    logger.d('auth initialize 5');
    try {
      _isFreshInstall = await authRepository.isFreshInstall();
      _userRole = await authRepository.getPermissionRole();
      _deviceId = await authRepository.getDeviceId() ?? '';
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

  Future<void> singIn(String username, String password) async {
    _loginData = const AsyncData(loading: true);
    notifyListeners();

    try {
      var result = await authRepository.signIn(username, password);
      _loginData = AsyncData(data: result);
    } catch (error) {
      _loginData = AsyncData(error: error);
    } finally {
      notifyListeners();
    }
  }

  void signOut() async {
    try {
      await authRepository.signOut();
    } catch (e) {
      // no op
    } finally {
      _userRole = PermissionRole.guest;
      notifyListeners();
    }
  }
}
