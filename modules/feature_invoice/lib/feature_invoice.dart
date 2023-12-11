
library micro;

import 'package:injectable/injectable.dart';

import 'package:auto_route/annotations.dart';

import 'feature_invoice.gm.dart';
export './feature_invoice.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureInvoicePackage() {}

@AutoRouterConfig.module()
class FeatureInvoiceRouterModule extends $FeatureInvoiceRouterModule {}
