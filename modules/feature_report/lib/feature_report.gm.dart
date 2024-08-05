// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:feature_report/src/contract/contract_page.dart' as _i2;
import 'package:feature_report/src/contract_template_detail/contract_template_detail_page.dart'
    as _i1;
import 'package:feature_report/src/estimate_master/estimate_master_page.dart'
    as _i3;
import 'package:feature_report/src/master_page.dart' as _i4;
import 'package:feature_report/src/prospective_rank/prospective_rank_page.dart'
    as _i5;
import 'package:feature_report/src/report_page.dart' as _i6;
import 'package:feature_report/src/type/type_page.dart' as _i7;

abstract class $FeatureReportRouterModule extends _i8.AutoRouterModule {
  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    ContractDetailRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ContractDetailPage(),
      );
    },
    ContractRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ContractPage(),
      );
    },
    EstimateMasterRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EstimateMasterPage(),
      );
    },
    MasterRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MasterPage(),
      );
    },
    ProspectivePankRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProspectivePankPage(),
      );
    },
    ReportsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ReportPage(),
      );
    },
    ReportTypeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ReportTypePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ContractDetailPage]
class ContractDetailRoute extends _i8.PageRouteInfo<void> {
  const ContractDetailRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ContractDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractDetailRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ContractPage]
class ContractRoute extends _i8.PageRouteInfo<void> {
  const ContractRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ContractRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EstimateMasterPage]
class EstimateMasterRoute extends _i8.PageRouteInfo<void> {
  const EstimateMasterRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EstimateMasterRoute.name,
          initialChildren: children,
        );

  static const String name = 'EstimateMasterRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MasterPage]
class MasterRoute extends _i8.PageRouteInfo<void> {
  const MasterRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MasterRoute.name,
          initialChildren: children,
        );

  static const String name = 'MasterRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProspectivePankPage]
class ProspectivePankRoute extends _i8.PageRouteInfo<void> {
  const ProspectivePankRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProspectivePankRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProspectivePankRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ReportPage]
class ReportsRoute extends _i8.PageRouteInfo<void> {
  const ReportsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ReportTypePage]
class ReportTypeRoute extends _i8.PageRouteInfo<void> {
  const ReportTypeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ReportTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportTypeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
