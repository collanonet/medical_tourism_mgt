import 'dart:ui';

import 'package:feature_auth/feature_auth.dart';
import 'package:injectable/injectable.dart';

import '../../routes/app_router.dart';
import '../../routes/guards.dart';

@module
abstract class AppModule {
  @singleton
  AppRouter appRouter(RoleGuard roleGuard) {
    return AppRouter(roleGuard: roleGuard);
  }

  @singleton
  RoleGuard get roleGuard {
    return RoleGuard(
      policies: {
        LoginRoute.name: [
          PermissionRole.guest,
        ]
      },
    );
  }

  @Named('defaultLocale')
  Locale get defaultLocale => const Locale('en');
}
