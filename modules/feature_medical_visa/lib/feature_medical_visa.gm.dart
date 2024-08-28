// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Package imports:
import 'package:auto_route/auto_route.dart' as _i3;

// Project imports:
import 'package:feature_medical_visa/src/medical_visa_page.dart' as _i2;

import 'package:feature_medical_visa/src/detail/medical_visa_detail_page.dart'
    as _i1;

abstract class $FeatureMedicalVisaRouterModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MedicalVisaDetailRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MedicalVisaDetailPage(),
      );
    },
    MedicalVisasRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MedicalVisaPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MedicalVisaDetailPage]
class MedicalVisaDetailRoute extends _i3.PageRouteInfo<void> {
  const MedicalVisaDetailRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MedicalVisaDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'MedicalVisaDetailRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MedicalVisaPage]
class MedicalVisasRoute extends _i3.PageRouteInfo<void> {
  const MedicalVisasRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MedicalVisasRoute.name,
          initialChildren: children,
        );

  static const String name = 'MedicalVisasRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
