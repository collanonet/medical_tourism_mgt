library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_sale.gm.dart';

export './feature_sale.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureSalePackage() {}

@AutoRouterConfig.module()
class FeatureSaleRouterModule extends $FeatureSaleRouterModule {}
