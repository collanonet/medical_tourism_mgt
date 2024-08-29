//@GeneratedMicroModule;CoreL10nPackageModule;package:core_l10n/core_l10n.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i2;
import 'dart:ui' as _i4;

// Package imports:
import 'package:core_storage/core_storage.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

// Project imports:
import 'src/l10n_model.dart' as _i3;

class CoreL10nPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.L10nModel>(() => _i3.L10nModel(
          defaultLocale: gh<_i4.Locale>(instanceName: 'defaultLocale'),
          storage: gh<_i5.Storage>(instanceName: 'localeStorage'),
        ));
  }
}
