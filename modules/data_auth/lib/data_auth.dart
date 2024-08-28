library micro;

export 'src/entities/index.dart';
export 'src/repositories/auth_repository.dart';
export 'src/exceptions/index.dart';

// Package imports:
import 'package:injectable/injectable.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataAuthPackage() {}
