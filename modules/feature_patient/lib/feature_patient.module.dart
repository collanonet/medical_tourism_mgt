//@GeneratedMicroModule;FeaturePatientPackageModule;package:feature_patient/feature_patient.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_patient/data_patient.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'src/patient/patient_model.dart' as _i3;
import 'src/pre_patient/pre_patient_model.dart' as _i5;

class FeaturePatientPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.PatientModel>(
        () => _i3.PatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i5.PrePatientModel>(() =>
        _i5.PrePatientModel(patientRepository: gh<_i4.PatientRepository>()));
  }
}
