// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:feature_report/src/report_page.dart' as _i1;
import 'package:feature_report/src/type/type_page.dart' as _i2;

abstract class $FeatureReportRouterModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ReportsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ReportPage(),
      );
    },
    ReportTypeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ReportTypePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ReportPage]
class ReportsRoute extends _i3.PageRouteInfo<void> {
  const ReportsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ReportTypePage]
class ReportTypeRoute extends _i3.PageRouteInfo<void> {
  const ReportTypeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ReportTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportTypeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
