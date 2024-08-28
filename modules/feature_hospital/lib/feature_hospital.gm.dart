// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Flutter imports:
import 'package:flutter/material.dart' as _i4;

// Package imports:
import 'package:auto_route/auto_route.dart' as _i3;

// Project imports:
import 'package:feature_hospital/src/detail/hospital_detail_page.dart' as _i1;
import 'package:feature_hospital/src/hospital_page.dart' as _i2;

abstract class $FeatureHospitalRouterModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HospitalDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<HospitalDetailRouteArgs>(
          orElse: () =>
              HospitalDetailRouteArgs(id: pathParams.optString('id')));
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HospitalDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HospitalsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HospitalPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HospitalDetailPage]
class HospitalDetailRoute extends _i3.PageRouteInfo<HospitalDetailRouteArgs> {
  HospitalDetailRoute({
    _i4.Key? key,
    String? id,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          HospitalDetailRoute.name,
          args: HospitalDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'HospitalDetailRoute';

  static const _i3.PageInfo<HospitalDetailRouteArgs> page =
      _i3.PageInfo<HospitalDetailRouteArgs>(name);
}

class HospitalDetailRouteArgs {
  const HospitalDetailRouteArgs({
    this.key,
    this.id,
  });

  final _i4.Key? key;

  final String? id;

  @override
  String toString() {
    return 'HospitalDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.HospitalPage]
class HospitalsRoute extends _i3.PageRouteInfo<void> {
  const HospitalsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HospitalsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HospitalsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
