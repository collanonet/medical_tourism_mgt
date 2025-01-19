import 'package:core_network/entities.dart';
import 'package:feature_chats/feature_chats.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/theme.dart';
import 'package:core_utils/core_utils.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../routes/app_router.dart';
import 'app_model.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  void initState() {
    super.initState();
    final app = context.read<AppModel>();
    app
      ..addListener(() {
        if (!app.ready) return;
        FlutterNativeSplash.remove();
      })
      ..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return NetworkImageProvider(
      configs: GetIt.I<NetworkImageConfigs>(),
      child: AppTheme(
        themeData: AppThemeData.light(),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: context.read<AppModel>().auth,
            ),
            ChangeNotifierProvider.value(
              value: context.read<AppModel>().l10n,
            ),
            Provider(
              create: (context) => GetIt.I<ChatModel>(),
            ),
          ],
          child: Consumer2<AuthModel, L10nModel>(
            builder: (context, auth, l10n, child) {
              if (auth.userRole != PermissionRole.guest) {
                auth.addListener(() {
                  if (auth.user != null) {
                    context.read<ChatModel>().initialize(auth.user!.id);
                  }
                });
              }
              return MaterialApp.router(
                title: 'Medical Tourism',
                theme: context.appTheme.build(context).copyWith(
                        pageTransitionsTheme:
                            const PageTransitionsTheme(builders: {
                      TargetPlatform.fuchsia:
                          NoShadowCupertinoPageTransitionsBuilder(),
                      TargetPlatform.android:
                          FadeUpwardsPageTransitionsBuilder(),
                    })),
                locale: l10n.locale,
                builder: BotToastInit(),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: GetIt.I<AppRouter>().config(
                  reevaluateListenable: auth,
                  navigatorObservers: () => [
                    ClearFocusNavigatorObserver(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
