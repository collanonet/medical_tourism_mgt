library micro;

import 'package:injectable/injectable.dart';

import 'package:auto_route/annotations.dart';

import 'feature_process_chart.gm.dart';
export './feature_process_chart.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureProcessChartPackage() {}

@AutoRouterConfig.module()
class FeatureProcessChartRouterModule extends $FeatureProcessChartRouterModule {}
