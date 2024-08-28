
library micro;

export 'src/repositories/patient_repository.dart';

// Package imports:
import 'package:injectable/injectable.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataPatientPackage() {}
