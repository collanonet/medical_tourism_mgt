// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:feature_patient/src/detail_patient/detail_patient_page.dart'
    as _i1;
import 'package:feature_patient/src/patient/patient_page.dart' as _i2;
import 'package:feature_patient/src/pre_patient/pre_patient_page.dart' as _i3;

abstract class $FeaturePatientRouterModule extends _i4.AutoRouterModule {
  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DetailPatientRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DetailPatientPage(),
      );
    },
    PatientsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PatientPage(),
      );
    },
    PrePatientRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PrePatientPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailPatientPage]
class DetailPatientRoute extends _i4.PageRouteInfo<void> {
  const DetailPatientRoute({List<_i4.PageRouteInfo>? children})
      : super(
          DetailPatientRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailPatientRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PatientPage]
class PatientsRoute extends _i4.PageRouteInfo<void> {
  const PatientsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          PatientsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PatientsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PrePatientPage]
class PrePatientRoute extends _i4.PageRouteInfo<void> {
  const PrePatientRoute({List<_i4.PageRouteInfo>? children})
      : super(
          PrePatientRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrePatientRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
