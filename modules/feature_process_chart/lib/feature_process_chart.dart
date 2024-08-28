library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_process_chart.gm.dart';

export './feature_process_chart.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureProcessChartPackage() {}

@AutoRouterConfig.module()
class FeatureProcessChartRouterModule extends $FeatureProcessChartRouterModule {}
