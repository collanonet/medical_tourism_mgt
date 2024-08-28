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
import 'package:feature_agent/src/agent_page.dart' as _i2;
import 'package:feature_agent/src/detail/agent_detail_page.dart' as _i1;

abstract class $FeatureAgentRouterModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AgentDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AgentDetailRouteArgs>(
          orElse: () => AgentDetailRouteArgs(id: pathParams.optString('id')));
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AgentDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    AgentsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AgentPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AgentDetailPage]
class AgentDetailRoute extends _i3.PageRouteInfo<AgentDetailRouteArgs> {
  AgentDetailRoute({
    _i4.Key? key,
    String? id,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          AgentDetailRoute.name,
          args: AgentDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'AgentDetailRoute';

  static const _i3.PageInfo<AgentDetailRouteArgs> page =
      _i3.PageInfo<AgentDetailRouteArgs>(name);
}

class AgentDetailRouteArgs {
  const AgentDetailRouteArgs({
    this.key,
    this.id,
  });

  final _i4.Key? key;

  final String? id;

  @override
  String toString() {
    return 'AgentDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.AgentPage]
class AgentsRoute extends _i3.PageRouteInfo<void> {
  const AgentsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          AgentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AgentsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
