// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:feature_web_appointment/src/detail/web_appointment_detail_page.dart'
    as _i1;
import 'package:feature_web_appointment/src/web_appointment_page.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

abstract class $FeatureWebAppointmentRouterModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    WebAppointmentDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebAppointmentDetailRouteArgs>(
          orElse: () =>
              WebAppointmentDetailRouteArgs(id: pathParams.optString('id')));
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.WebAppointmentDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    WebAppointmentsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.WebAppointmentPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.WebAppointmentDetailPage]
class WebAppointmentDetailRoute
    extends _i3.PageRouteInfo<WebAppointmentDetailRouteArgs> {
  WebAppointmentDetailRoute({
    _i4.Key? key,
    String? id,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          WebAppointmentDetailRoute.name,
          args: WebAppointmentDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'WebAppointmentDetailRoute';

  static const _i3.PageInfo<WebAppointmentDetailRouteArgs> page =
      _i3.PageInfo<WebAppointmentDetailRouteArgs>(name);
}

class WebAppointmentDetailRouteArgs {
  const WebAppointmentDetailRouteArgs({
    this.key,
    this.id,
  });

  final _i4.Key? key;

  final String? id;

  @override
  String toString() {
    return 'WebAppointmentDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.WebAppointmentPage]
class WebAppointmentsRoute extends _i3.PageRouteInfo<void> {
  const WebAppointmentsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          WebAppointmentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebAppointmentsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
