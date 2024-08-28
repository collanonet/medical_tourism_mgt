//@GeneratedMicroModule;FeatureChatsPackageModule;package:feature_chats/feature_chats.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i2;

// Package imports:
import 'package:data_auth/data_auth.dart' as _i4;
import 'package:data_patient/data_patient.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

// Project imports:
import 'src/chat_model.dart' as _i3;

class FeatureChatsPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.ChatModel>(() => _i3.ChatModel(
          authRepository: gh<_i4.AuthRepository>(),
          patientRepository: gh<_i5.PatientRepository>(),
        ));
  }
}
