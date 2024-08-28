//@GeneratedMicroModule;FeatureAgentPackageModule;package:feature_agent/feature_agent.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i2;

// Package imports:
import 'package:data_agent/data_agent.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

// Project imports:
import 'src/agent_model.dart' as _i8;
import 'src/detail/agent_detail_model.dart' as _i3;
import 'src/detail/sub/basic_information/basic_information_model.dart' as _i6;
import 'src/detail/sub/contract/contract_model.dart' as _i5;
import 'src/detail/sub/estimate_invoice/estimate_invoice_model.dart' as _i7;

class FeatureAgentPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.AgentDetailModel>(
        () => _i3.AgentDetailModel(authRepository: gh<_i4.AgentRepository>()));
    gh.factory<_i5.ContractModel>(
        () => _i5.ContractModel(authRepository: gh<_i4.AgentRepository>()));
    gh.factory<_i6.AgentBasicInformationModel>(() =>
        _i6.AgentBasicInformationModel(
            authRepository: gh<_i4.AgentRepository>()));
    gh.factory<_i7.EstimateInvoiceModel>(() =>
        _i7.EstimateInvoiceModel(authRepository: gh<_i4.AgentRepository>()));
    gh.factory<_i8.AgentModel>(
        () => _i8.AgentModel(authRepository: gh<_i4.AgentRepository>()));
  }
}
