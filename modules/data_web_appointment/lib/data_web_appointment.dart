
library micro;

import 'package:injectable/injectable.dart';

export 'src/repositories/web_appointment_repository.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataWebAppointmentPackage() {}
