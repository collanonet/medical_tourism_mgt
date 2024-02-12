//@GeneratedMicroModule;FeatureAuthPackageModule;package:feature_auth/feature_auth.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_auth/data_auth.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'src/auth_model.dart' as _i3;

class FeatureAuthPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.AuthModel>(
        () => _i3.AuthModel(authRepository: gh<_i4.AuthRepository>()));
  }
}
