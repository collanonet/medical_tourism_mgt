library micro;

export 'src/entities/index.dart';
export 'src/repositories/auth_repository.dart';
export 'src/exceptions/index.dart';

import 'package:injectable/injectable.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataAuthzPackage() {}
