library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_hospital.gm.dart';

export './feature_hospital.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureHospitalPackage() {}

@AutoRouterConfig.module()
class FeatureHospitalRouterModule extends $FeatureHospitalRouterModule {}
