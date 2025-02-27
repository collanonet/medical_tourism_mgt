//@GeneratedMicroModule;FeatureReportPackageModule;package:feature_report/feature_report.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_report/data_report.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'src/contract/contract_model.dart' as _i3;
import 'src/contract_template_detail/contract_template_detail_model.dart'
    as _i5;
import 'src/estimate_master/estimate_master_model.dart' as _i6;
import 'src/prospective_rank/prospective_rank_model.dart' as _i7;
import 'src/report_model.dart' as _i8;
import 'src/type/type_model.dart' as _i9;

class FeatureReportPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.ContractModel>(
        () => _i3.ContractModel(reportRepository: gh<_i4.ReportRepository>()));
    gh.factory<_i5.ContractTemplateModel>(() => _i5.ContractTemplateModel(
        reportRepository: gh<_i4.ReportRepository>()));
    gh.factory<_i6.EstimateMasterModel>(() =>
        _i6.EstimateMasterModel(reportRepository: gh<_i4.ReportRepository>()));
    gh.factory<_i7.ProspectiveRankModel>(() =>
        _i7.ProspectiveRankModel(reportRepository: gh<_i4.ReportRepository>()));
    gh.factory<_i8.ReportModel>(
        () => _i8.ReportModel(reportRepository: gh<_i4.ReportRepository>()));
    gh.factory<_i9.TypeModel>(
        () => _i9.TypeModel(reportRepository: gh<_i4.ReportRepository>()));
  }
}
