//@GeneratedMicroModule;DataProcessChartPackageModule;package:data_process_chart/data_process_chart.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_network/core_network.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

import 'src/providers/process_chart_local_provider.dart' as _i3;
import 'src/providers/process_chart_remote_provider.dart' as _i4;
import 'src/repositories/process_chart_repository.dart' as _i6;
import 'src/repositories/process_chart_repository_impl.dart' as _i7;

class DataProcessChartPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.ProcessChartLocalProvider>(
        () => _i3.ProcessChartLocalProvider());
    gh.factory<_i4.ProcessChartRemoteProvider>(
        () => _i4.ProcessChartRemoteProvider(apiService: gh<_i5.ApiService>()));
    gh.factory<_i6.ProcessChartRepository>(() => _i7.ProcessChartRepositoryIml(
          remote: gh<_i4.ProcessChartRemoteProvider>(),
          local: gh<_i3.ProcessChartLocalProvider>(),
        ));
  }
}
