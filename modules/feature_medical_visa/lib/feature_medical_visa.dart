
library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_medical_visa.gm.dart';

export './feature_medical_visa.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureMedicalVisaPackage() {}

@AutoRouterConfig.module()
class FeatureMedicalVisaRouterModule extends $FeatureMedicalVisaRouterModule {}
