// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Package imports:
import 'package:auto_route/auto_route.dart' as _i2;

// Project imports:
import 'package:feature_sale/src/sale_page.dart' as _i1;

abstract class $FeatureSaleRouterModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SalesRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SalePage(),
      );
    }
  };
}

/// generated route for
/// [_i1.SalePage]
class SalesRoute extends _i2.PageRouteInfo<void> {
  const SalesRoute({List<_i2.PageRouteInfo>? children})
      : super(
          SalesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SalesRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
