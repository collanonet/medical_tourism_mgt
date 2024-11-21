library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_patient.gm.dart';

export './feature_patient.gm.dart';

export './src/detail_patient/web_reservation/detail_patient_web_reservation_page.dart';
export './src/detail_patient/medical_visa/medical_visa_page.dart';
export './src/patient/patient_page_for_agent.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeaturePatientPackage() {}

@AutoRouterConfig.module()
class FeaturePatientRouterModule extends $FeaturePatientRouterModule {}
