import 'package:feature_auth/feature_auth.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:get_it/get_it.dart';

import '../app/app_model.dart';

import 'guards.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: [
    // FeatureAuthzRouterModule,
  ],
)
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter({required this.roleGuard});

  final RoleGuard roleGuard;
  AuthModel? _authz;
  void Function()? _authListener;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await roleGuard.resolve(resolver.route.name)) {
      resolver.next(true);
    } else {
      // resolver.redirect(const OnboardRoute());

      listener() async {
        final resolved = await roleGuard.resolve(resolver.route.name);
        if (resolved) {
          router.popUntilRoot();
          resolver.next(true);

          unsubscribeAuthListener();
        }
      }

      _authListener = listener;
      // _authz = GetIt.I<AppModel>().authz..addListener(listener);
    }
  }

  @override
  void dispose() {
    unsubscribeAuthListener();
    super.dispose();
  }

  void unsubscribeAuthListener() {
    if (_authListener != null) {
      _authz?.removeListener(_authListener!);
      _authListener = null;
    }
  }

  @override
  List<AutoRoute> get routes {
    return [
      // AutoRoute(page: HomeRoute.page, initial: true, path: '/'),
      // AutoRoute(page: OnboardRoute.page),

      RedirectRoute(path: '*', redirectTo: '/')
    ];
  }
}
