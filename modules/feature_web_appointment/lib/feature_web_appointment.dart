library micro;

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'feature_web_appointment.gm.dart';

export './feature_web_appointment.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureWebAppointmentPackage() {}

@AutoRouterConfig.module()
class FeatureWebAppointmentRouterModule extends $FeatureWebAppointmentRouterModule {}
