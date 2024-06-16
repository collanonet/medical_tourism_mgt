//@GeneratedMicroModule;DataPatientPackageModule;package:data_patient/data_patient.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_network/core_network.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'src/providers/patient_remote_provider.dart' as _i3;
import 'src/repositories/patient_repository.dart' as _i5;
import 'src/repositories/patient_repository_impl.dart' as _i6;

class DataPatientPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.PatientRemoteProvider>(() => _i3.PatientRemoteProvider(
          apiService: gh<_i4.ApiService>(),
          fileUploadService: gh<_i4.FileUploadService>(),
        ));
    gh.factory<_i5.PatientRepository>(() =>
        _i6.PatientRepositoryIml(remote: gh<_i3.PatientRemoteProvider>()));
  }
}
