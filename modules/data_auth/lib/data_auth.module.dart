//@GeneratedMicroModule;DataAuthPackageModule;package:data_auth/data_auth.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i2;

// Package imports:
import 'package:core_network/core_network.dart' as _i7;
import 'package:core_storage/core_storage.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

// Project imports:
import 'src/providers/auth_local_provider.dart' as _i4;
import 'src/providers/auth_provider.dart' as _i3;
import 'src/providers/auth_remote_provider.dart' as _i6;
import 'src/repositories/auth_repository.dart' as _i8;
import 'src/repositories/auth_repository_impl.dart' as _i9;

class DataAuthPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.AuthProvider>(
      () => _i4.AuthLocalProvider(
          storage: gh<_i5.Storage>(instanceName: 'authStorage')),
      instanceName: 'localAuth',
    );
    gh.factory<_i3.AuthProvider>(
      () => _i6.AuthRemoteProvider(apiService: gh<_i7.ApiService>()),
      instanceName: 'remoteAuth',
    );
    gh.factory<_i8.AuthRepository>(() => _i9.AuthRepositoryImpl(
          local: gh<_i3.AuthProvider>(instanceName: 'localAuth'),
          remote: gh<_i3.AuthProvider>(instanceName: 'remoteAuth'),
        ));
  }
}
