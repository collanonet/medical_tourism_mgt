library micro;

import 'package:injectable/injectable.dart';

import 'package:auto_route/annotations.dart';

import 'feature_web_appointment.gm.dart';
export './feature_web_appointment.gm.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initFeatureWebAppointmentPackage() {}

@AutoRouterConfig.module()
class FeatureWebAppointmentRouterModule extends $FeatureWebAppointmentRouterModule {}
