library micro;

import 'package:injectable/injectable.dart';
import 'package:auto_route/annotations.dart';

import 'feature_hospital.gm.dart';
export './feature_hospital.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureHospitalPackage() {}

@AutoRouterConfig.module()
class FeatureHospitalRouterModule extends $FeatureHospitalRouterModule {}
