
library micro;

import 'package:injectable/injectable.dart';

export './src/repositories/medical_visa_repository.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataMedicalVisaPackage() {}
