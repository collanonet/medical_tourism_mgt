library micro;

import 'package:injectable/injectable.dart';
import 'package:auto_route/annotations.dart';

import 'feature_chats.gm.dart';
export './feature_chats.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureChatsPackage() {}

@AutoRouterConfig.module()
class FeatureChatsRouterModule extends $FeatureChatsRouterModule {}
