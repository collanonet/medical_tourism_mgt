// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:feature_hospital/src/hospital_page.dart' as _i1;

abstract class $FeatureHospitalRouterModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HospitalsRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HospitalPage(),
      );
    }
  };
}

/// generated route for
/// [_i1.HospitalPage]
class HospitalsRoute extends _i2.PageRouteInfo<void> {
  const HospitalsRoute({List<_i2.PageRouteInfo>? children})
      : super(
          HospitalsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HospitalsRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
