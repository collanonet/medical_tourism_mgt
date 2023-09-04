import 'package:data_auth/data_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthModel extends ChangeNotifier {
  // AuthModel({
  //   // required this.authzRepository,
  // });

  // final AuthzRepository authzRepository;

  PermissionRole _userRole = PermissionRole.guest;

  PermissionRole get userRole => _userRole;

  bool _isFreshInstall = true;

  String _deviceId = '';

  bool get isFreshInstall => _isFreshInstall;

  String get deviceId => _deviceId;

  Future<void> initialize() async {
    try {
      // _isFreshInstall = await authzRepository.isFreshInstall();
      // _userRole = await authzRepository.getPermissionRole();
      // _deviceId = await authzRepository.getDeviceId() ?? '';
    } catch (e) {
      _userRole = PermissionRole.guest;
    } finally {
      notifyListeners();
    }
  }

  Future<void> syncAuthState() async {
    try {
      // _userRole = await authzRepository.getPermissionRole();
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

  void signOut() async {
    try {
      // await authzRepository.signOut();
    } catch (e) {
      // no op
    } finally {
      _userRole = PermissionRole.guest;
      notifyListeners();
    }
  }
}
