library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_agent.gm.dart';

export './feature_agent.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureAgentPackage() {}

@AutoRouterConfig.module()
class FeatureAgentRouterModule extends $FeatureAgentRouterModule {}
