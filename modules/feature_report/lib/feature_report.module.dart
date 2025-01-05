//@GeneratedMicroModule;FeatureReportPackageModule;package:feature_report/feature_report.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i2;

// Package imports:
import 'package:data_report/data_report.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

// Project imports:
import 'src/contract/contract_model.dart' as _i3;
import 'src/estimate_master/estimate_master_model.dart' as _i9;
import 'src/prospective_rank/prospective_rank_model.dart' as _i5;
import 'src/report_model.dart' as _i7;
import 'src/type/type_model.dart' as _i8;

import 'src/contract_template_detail/contract_template_detail_model.dart'
    as _i6;

class FeatureReportPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.ContractModel>(
        () => _i3.ContractModel(reportRepository: gh<_i4.ReportRepository>()));
    gh.factory<_i5.ProspectiveRankModel>(() =>
        _i5.ProspectiveRankModel(reportRepository: gh<_i4.ReportRepository>()));
    gh.factory<_i6.ContractTemplateModel>(() => _i6.ContractTemplateModel(
        reportRepository: gh<_i4.ReportRepository>()));
    gh.factory<_i7.ReportModel>(
        () => _i7.ReportModel(reportRepository: gh<_i4.ReportRepository>()));
    gh.factory<_i8.TypeModel>(
        () => _i8.TypeModel(reportRepository: gh<_i4.ReportRepository>()));
    gh.factory<_i9.EstimateMasterModel>(() =>
        _i9.EstimateMasterModel(reportRepository: gh<_i4.ReportRepository>()));
  }
}
