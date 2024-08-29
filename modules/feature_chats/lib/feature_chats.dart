library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_chats.gm.dart';

export './feature_chats.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureChatsPackage() {}

@AutoRouterConfig.module()
class FeatureChatsRouterModule extends $FeatureChatsRouterModule {}
