// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Flutter imports:
import 'package:flutter/material.dart' as _i5;

// Package imports:
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:core_network/entities.dart' as _i6;

// Project imports:
import 'package:feature_patient/src/patient/patient_page.dart' as _i2;
import 'package:feature_patient/src/pre_patient/pre_patient_page.dart' as _i3;

import 'package:feature_patient/src/detail_patient/detail_patient_page.dart'
    as _i1;

abstract class $FeaturePatientRouterModule extends _i4.AutoRouterModule {
  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DetailPatientRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailPatientRouteArgs>(
          orElse: () => DetailPatientRouteArgs(id: pathParams.optString('id')));
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailPatientPage(
          key: args.key,
          id: args.id,
          patient: args.patient,
        ),
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
class DetailPatientRoute extends _i4.PageRouteInfo<DetailPatientRouteArgs> {
  DetailPatientRoute({
    _i5.Key? key,
    String? id,
    _i6.Patient? patient,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DetailPatientRoute.name,
          args: DetailPatientRouteArgs(
            key: key,
            id: id,
            patient: patient,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'DetailPatientRoute';

  static const _i4.PageInfo<DetailPatientRouteArgs> page =
      _i4.PageInfo<DetailPatientRouteArgs>(name);
}

class DetailPatientRouteArgs {
  const DetailPatientRouteArgs({
    this.key,
    this.id,
    this.patient,
  });

  final _i5.Key? key;

  final String? id;

  final _i6.Patient? patient;

  @override
  String toString() {
    return 'DetailPatientRouteArgs{key: $key, id: $id, patient: $patient}';
  }
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
