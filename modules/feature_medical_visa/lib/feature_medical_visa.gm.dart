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
import 'package:core_network/core_network.dart' as _i5;

// Project imports:
import 'package:feature_medical_visa/src/medical_visa_page.dart' as _i2;

import 'package:feature_medical_visa/src/detail/medical_visa_detail_page.dart'
    as _i1;

abstract class $FeatureMedicalVisaRouterModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MedicalVisaDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MedicalVisaDetailRouteArgs>(
          orElse: () =>
              MedicalVisaDetailRouteArgs(id: pathParams.optString('id')));
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MedicalVisaDetailPage(
          key: args.key,
          id: args.id,
          patient: args.patient,
        ),
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
class MedicalVisaDetailRoute
    extends _i3.PageRouteInfo<MedicalVisaDetailRouteArgs> {
  MedicalVisaDetailRoute({
    _i4.Key? key,
    String? id,
    _i5.Patient? patient,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          MedicalVisaDetailRoute.name,
          args: MedicalVisaDetailRouteArgs(
            key: key,
            id: id,
            patient: patient,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'MedicalVisaDetailRoute';

  static const _i3.PageInfo<MedicalVisaDetailRouteArgs> page =
      _i3.PageInfo<MedicalVisaDetailRouteArgs>(name);
}

class MedicalVisaDetailRouteArgs {
  const MedicalVisaDetailRouteArgs({
    this.key,
    this.id,
    this.patient,
  });

  final _i4.Key? key;

  final String? id;

  final _i5.Patient? patient;

  @override
  String toString() {
    return 'MedicalVisaDetailRouteArgs{key: $key, id: $id, patient: $patient}';
  }
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
