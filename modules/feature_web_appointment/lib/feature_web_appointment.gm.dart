// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:feature_web_appointment/src/web_appointment_page.dart' as _i1;

abstract class $FeatureWebAppointmentRouterModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    WebAppointmentsRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.WebAppointmentPage(),
      );
    }
  };
}

/// generated route for
/// [_i1.WebAppointmentPage]
class WebAppointmentsRoute extends _i2.PageRouteInfo<void> {
  const WebAppointmentsRoute({List<_i2.PageRouteInfo>? children})
      : super(
          WebAppointmentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebAppointmentsRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
