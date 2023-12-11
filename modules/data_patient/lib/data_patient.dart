
library micro;

export 'src/repositories/patient_repository.dart';
import 'package:injectable/injectable.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataPatientPackage() {}
