// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:feature_patient/src/patient/patient_page.dart' as _i1;
import 'package:feature_patient/src/pre_patient/pre_patient_page.dart' as _i2;

abstract class $FeaturePatientRouterModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    PatientsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PatientPage(),
      );
    },
    PrePatientRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PrePatientPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.PatientPage]
class PatientsRoute extends _i3.PageRouteInfo<void> {
  const PatientsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          PatientsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PatientsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PrePatientPage]
class PrePatientRoute extends _i3.PageRouteInfo<void> {
  const PrePatientRoute({List<_i3.PageRouteInfo>? children})
      : super(
          PrePatientRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrePatientRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
