//@GeneratedMicroModule;DataMedicalVisaPackageModule;package:data_medical_visa/data_medical_visa.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_network/core_network.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

import 'src/providers/medical_visa_local_provider.dart' as _i3;
import 'src/providers/medical_visa_remote_provider.dart' as _i4;
import 'src/repositories/medical_visa_repository.dart' as _i6;
import 'src/repositories/medical_visa_repository_impl.dart' as _i7;

class DataMedicalVisaPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.MedicalVisaLocalProvider>(
        () => _i3.MedicalVisaLocalProvider());
    gh.factory<_i4.MedicalVisaRemoteProvider>(
        () => _i4.MedicalVisaRemoteProvider(apiService: gh<_i5.ApiService>()));
    gh.factory<_i6.MedicalVisaRepository>(() => _i7.MedicalVisaRepositoryIml(
          remote: gh<_i4.MedicalVisaRemoteProvider>(),
          local: gh<_i3.MedicalVisaLocalProvider>(),
        ));
  }
}
