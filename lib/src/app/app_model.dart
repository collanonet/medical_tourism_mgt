import 'package:flutter/widgets.dart';

import 'package:core_l10n/l10n.dart';
import 'package:core_utils/core_utils.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppModel extends ChangeNotifier {
  AppModel({
    required this.auth,
    required this.l10n,
  });

  AuthModel auth;
  L10nModel l10n;

  AsyncData<bool> _ready = const AsyncData<bool>(data: false, loading: true);
  bool get ready => _ready.requiredData;

  Future<void> initialize() async {
    auth.addListener(() {
      final role = auth.userRole;
      if (role == PermissionRole.user) {
        // biz.initialize();
      } else {
        // biz.clear();
      }
    });
    logger.d("here now 3");
    await Future.wait([
      auth.initialize(),
      l10n.initialize(),
    ]);
    logger.d("here now 4");
    _ready = const AsyncData(data: true);

    notifyListeners();
  }

  void signOut() {
    auth.signOut();
  }
}
