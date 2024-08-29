library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_auth.gm.dart';

export 'package:data_auth/data_auth.dart';

export './feature_auth.gm.dart';
export 'src/auth_model.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureAuthzPackage() {}

@AutoRouterConfig.module()
class FeatureAuthRouterModule extends $FeatureAuthRouterModule {}
