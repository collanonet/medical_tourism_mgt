//@GeneratedMicroModule;CoreNetworkPackageModule;package:core_network/core_network.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;

import 'core_network.dart' as _i4;
import 'src/api_service.dart' as _i3;

class CoreNetworkPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.singleton<_i3.ApiService>(_i3.ApiService(gh<_i4.RestClient>()));
  }
}
