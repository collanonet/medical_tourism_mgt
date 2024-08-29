library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_report.gm.dart';

export './feature_report.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureReportPackage() {}

@AutoRouterConfig.module()
class FeatureReportRouterModule extends $FeatureReportRouterModule {}
