// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:feature_process_chart/src/detail/detail_process_chart_page.dart'
    as _i1;
import 'package:feature_process_chart/src/itinerary_simplified/itinerary_simplified_page.dart'
    as _i2;
import 'package:feature_process_chart/src/process_chart_page.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $FeatureProcessChartRouterModule extends _i4.AutoRouterModule {
  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DetailProcessChartRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailProcessChartRouteArgs>(
          orElse: () =>
              DetailProcessChartRouteArgs(id: pathParams.optString('id')));
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailProcessChartPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ItinerarySimplifiedRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ItinerarySimplifiedPage(),
      );
    },
    ProcessChartsRoute.name: (routeData) {
      final args = routeData.argsAs<ProcessChartsRouteArgs>(
          orElse: () => const ProcessChartsRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ProcessChartPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailProcessChartPage]
class DetailProcessChartRoute
    extends _i4.PageRouteInfo<DetailProcessChartRouteArgs> {
  DetailProcessChartRoute({
    _i5.Key? key,
    String? id,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DetailProcessChartRoute.name,
          args: DetailProcessChartRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'DetailProcessChartRoute';

  static const _i4.PageInfo<DetailProcessChartRouteArgs> page =
      _i4.PageInfo<DetailProcessChartRouteArgs>(name);
}

class DetailProcessChartRouteArgs {
  const DetailProcessChartRouteArgs({
    this.key,
    this.id,
  });

  final _i5.Key? key;

  final String? id;

  @override
  String toString() {
    return 'DetailProcessChartRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.ItinerarySimplifiedPage]
class ItinerarySimplifiedRoute extends _i4.PageRouteInfo<void> {
  const ItinerarySimplifiedRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ItinerarySimplifiedRoute.name,
          initialChildren: children,
        );

  static const String name = 'ItinerarySimplifiedRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProcessChartPage]
class ProcessChartsRoute extends _i4.PageRouteInfo<ProcessChartsRouteArgs> {
  ProcessChartsRoute({
    _i5.Key? key,
    String? id,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ProcessChartsRoute.name,
          args: ProcessChartsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ProcessChartsRoute';

  static const _i4.PageInfo<ProcessChartsRouteArgs> page =
      _i4.PageInfo<ProcessChartsRouteArgs>(name);
}

class ProcessChartsRouteArgs {
  const ProcessChartsRouteArgs({
    this.key,
    this.id,
  });

  final _i5.Key? key;

  final String? id;

  @override
  String toString() {
    return 'ProcessChartsRouteArgs{key: $key, id: $id}';
  }
}
