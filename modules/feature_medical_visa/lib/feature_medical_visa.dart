
library micro;

import 'package:injectable/injectable.dart';
import 'package:auto_route/annotations.dart';

import 'feature_medical_visa.gm.dart';
export './feature_medical_visa.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureMedicalVisaPackage() {}

@AutoRouterConfig.module()
class FeatureMedicalVisaRouterModule extends $FeatureMedicalVisaRouterModule {}
