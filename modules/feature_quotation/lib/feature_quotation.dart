library micro;

import 'package:injectable/injectable.dart';
import 'package:auto_route/annotations.dart';

import 'feature_quotation.gm.dart';
export './feature_quotation.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureQuotationPackage() {}

@AutoRouterConfig.module()
class FeatureQuotationRouterModule extends $FeatureQuotationRouterModule {}
