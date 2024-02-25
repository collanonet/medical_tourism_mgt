//@GeneratedMicroModule;FeatureReportPackageModule;package:feature_report/feature_report.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_report/data_report.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'src/report_model.dart' as _i3;
import 'src/type/type_model.dart' as _i5;

class FeatureReportPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.ReportModel>(
        () => _i3.ReportModel(reportRepository: gh<_i4.ReportRepository>()));
    gh.factory<_i5.TypeModel>(
        () => _i5.TypeModel(reportRepository: gh<_i4.ReportRepository>()));
  }
}
