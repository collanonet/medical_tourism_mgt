//@GeneratedMicroModule;DataWebAppointmentPackageModule;package:data_web_appointment/data_web_appointment.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_network/core_network.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'src/providers/web_appointment_remote_provider.dart' as _i3;
import 'src/repositories/web_appointment_repository.dart' as _i5;
import 'src/repositories/web_appointment_repository_impl.dart' as _i6;

class DataWebAppointmentPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.WebAppointmentRemoteProvider>(() =>
        _i3.WebAppointmentRemoteProvider(apiService: gh<_i4.ApiService>()));
    gh.factory<_i5.WebAppointmentRepository>(() =>
        _i6.WebAppointmentRepositoryIml(
            remote: gh<_i3.WebAppointmentRemoteProvider>()));
  }
}
