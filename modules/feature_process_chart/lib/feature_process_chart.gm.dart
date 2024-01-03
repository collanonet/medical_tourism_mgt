// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:feature_process_chart/src/detail/detail_process_chart_page.dart'
    as _i1;
import 'package:feature_process_chart/src/process_chart_page.dart' as _i2;

abstract class $FeatureProcessChartRouterModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DetailProcessChartRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DetailProcessChartPage(),
      );
    },
    ProcessChartsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ProcessChartPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailProcessChartPage]
class DetailProcessChartRoute extends _i3.PageRouteInfo<void> {
  const DetailProcessChartRoute({List<_i3.PageRouteInfo>? children})
      : super(
          DetailProcessChartRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailProcessChartRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ProcessChartPage]
class ProcessChartsRoute extends _i3.PageRouteInfo<void> {
  const ProcessChartsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ProcessChartsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProcessChartsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
