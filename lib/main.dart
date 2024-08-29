import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/app/app.dart';
import 'src/app/app_model.dart';
import 'src/config/server.dart';
import 'src/di/injection.dart';

Future<void> init(Server server) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await configureDependencies(server);
  // await PackageInfo.fromPlatform(
  //   baseUrl: server.name == 'dev'
  //       ? 'https://medical-tourism-dev.web.app/'
  //       : 'https://medical-tourism-stage.web.app/',
  // );
  Provider.debugCheckInvalidValueType = null;
  runApp(
    ChangeNotifierProvider(
      create: (_) => GetIt.I<AppModel>(),
      child: const RootApp(),
    ),
  );
}
