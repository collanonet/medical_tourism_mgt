import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'package:medical_tourism_mgt/src/app/app.dart';
import 'package:medical_tourism_mgt/src/app/app_model.dart';
import 'package:medical_tourism_mgt/src/config/server.dart';
import 'package:medical_tourism_mgt/src/di/injection.dart';

void main() {
  init(Server.dev);
}

Future<void> init(Server server) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await configureDependencies(server);
  Provider.debugCheckInvalidValueType = null;
  runApp(
    ChangeNotifierProvider(
      create: (_) => GetIt.I<AppModel>(),
      child: const RootApp(),
    ),
  );
}
