library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_quotation.gm.dart';

export './feature_quotation.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureQuotationPackage() {}

@AutoRouterConfig.module()
class FeatureQuotationRouterModule extends $FeatureQuotationRouterModule {}
