library micro;

import 'package:injectable/injectable.dart';
import 'package:auto_route/annotations.dart';

import 'feature_patient.gm.dart';
export './feature_patient.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeaturePatientPackage() {}

@AutoRouterConfig.module()
class FeaturePatientRouterModule extends $FeaturePatientRouterModule {}
