//@GeneratedMicroModule;FeatureAgentPackageModule;package:feature_agent/feature_agent.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_agent/data_agent.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'src/agent_model.dart' as _i6;
import 'src/detail/agent_detail_model.dart' as _i5;
import 'src/detail/sub/basic_information/basic_information_model.dart' as _i3;

class FeatureAgentPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.AgentBasicInformationModel>(() =>
        _i3.AgentBasicInformationModel(
            authRepository: gh<_i4.AgentRepository>()));
    gh.factory<_i5.AgentDetailModel>(
        () => _i5.AgentDetailModel(authRepository: gh<_i4.AgentRepository>()));
    gh.factory<_i6.AgentModel>(
        () => _i6.AgentModel(authRepository: gh<_i4.AgentRepository>()));
  }
}
