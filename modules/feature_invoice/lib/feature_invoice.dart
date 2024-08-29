
library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_invoice.gm.dart';

export './feature_invoice.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureInvoicePackage() {}

@AutoRouterConfig.module()
class FeatureInvoiceRouterModule extends $FeatureInvoiceRouterModule {}
