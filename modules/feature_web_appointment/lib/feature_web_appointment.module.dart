//@GeneratedMicroModule;FeatureWebAppointmentPackageModule;package:feature_web_appointment/feature_web_appointment.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_auth/data_auth.dart' as _i4;
import 'package:data_patient/data_patient.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

import 'src/detail/web_appointment_detail_model.dart' as _i3;
import 'src/web_appointment_model.dart' as _i6;

class FeatureWebAppointmentPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.WebAppointmentDetailModel>(
        () => _i3.WebAppointmentDetailModel(
              authRepository: gh<_i4.AuthRepository>(),
              patientRepository: gh<_i5.PatientRepository>(),
            ));
    gh.factory<_i6.WebAppointmentModel>(() => _i6.WebAppointmentModel(
          authRepository: gh<_i4.AuthRepository>(),
          patientRepository: gh<_i5.PatientRepository>(),
        ));
  }
}
