// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i7;

import 'package:core_l10n/core_l10n.module.dart' as _i10;
import 'package:core_l10n/l10n.dart' as _i6;
import 'package:core_network/core_network.module.dart' as _i11;
import 'package:core_storage/core_storage.module.dart' as _i4;
import 'package:data_auth/data_auth.module.dart' as _i3;
import 'package:feature_auth/feature_auth.module.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/app_model.dart' as _i5;
import '../routes/app_router.dart' as _i9;
import '../routes/guards.dart' as _i8;
import 'modules/app_module.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.DataAuthPackageModule().init(gh);
    await _i4.CoreStoragePackageModule().init(gh);
    final appModule = _$AppModule();
    gh.lazySingleton<_i5.AppModel>(
        () => _i5.AppModel(l10n: gh<_i6.L10nModel>()));
    gh.factory<Duration>(
      () => appModule.khqrTTL,
      instanceName: 'khqrTTL',
    );
    gh.factory<List<String>>(
      () => appModule.allowedHosts,
      instanceName: 'allowedHosts',
    );
    gh.factory<_i7.Locale>(
      () => appModule.defaultLocale,
      instanceName: 'defaultLocale',
    );
    gh.singleton<_i8.RoleGuard>(appModule.roleGuard);
    gh.factory<Uri>(
      () => appModule.merchantAgreement,
      instanceName: 'merchantAgreement',
    );
    gh.factory<Uri>(
      () => appModule.termsAndConditions,
      instanceName: 'termsAndConditions',
    );
    gh.singleton<_i9.AppRouter>(appModule.appRouter(gh<_i8.RoleGuard>()));
    await _i10.CoreL10nPackageModule().init(gh);
    await _i11.CoreNetworkPackageModule().init(gh);
    await _i12.FeatureAuthPackageModule().init(gh);
    return this;
  }
}

class _$AppModule extends _i13.AppModule {}
