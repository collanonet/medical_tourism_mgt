// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:feature_report/src/master_page.dart' as _i1;
import 'package:feature_report/src/report_page.dart' as _i2;
import 'package:feature_report/src/type/type_page.dart' as _i3;

abstract class $FeatureReportRouterModule extends _i4.AutoRouterModule {
  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MasterRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MasterPage(),
      );
    },
    ReportsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ReportPage(),
      );
    },
    ReportTypeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ReportTypePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MasterPage]
class MasterRoute extends _i4.PageRouteInfo<void> {
  const MasterRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MasterRoute.name,
          initialChildren: children,
        );

  static const String name = 'MasterRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ReportPage]
class ReportsRoute extends _i4.PageRouteInfo<void> {
  const ReportsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ReportTypePage]
class ReportTypeRoute extends _i4.PageRouteInfo<void> {
  const ReportTypeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ReportTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportTypeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
