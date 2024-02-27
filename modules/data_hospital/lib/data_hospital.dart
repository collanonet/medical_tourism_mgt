
library micro;

import 'package:injectable/injectable.dart';

export './src/repositories/hospital_repository.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataHospitalPackage() {}
