// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:feature_agent/src/agent_page.dart' as _i1;

abstract class $FeatureAgentRouterModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    AgentsRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AgentPage(),
      );
    }
  };
}

/// generated route for
/// [_i1.AgentPage]
class AgentsRoute extends _i2.PageRouteInfo<void> {
  const AgentsRoute({List<_i2.PageRouteInfo>? children})
      : super(
          AgentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AgentsRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
