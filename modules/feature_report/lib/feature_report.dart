library micro;

import 'package:injectable/injectable.dart';
import 'package:auto_route/annotations.dart';

import 'feature_report.gm.dart';
export './feature_report.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureReportPackage() {}

@AutoRouterConfig.module()
class FeatureReportRouterModule extends $FeatureReportRouterModule {}
