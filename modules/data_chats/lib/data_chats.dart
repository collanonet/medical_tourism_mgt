
library micro;

// Package imports:
import 'package:injectable/injectable.dart';

export './src/repositories/chat_repository.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataChatsPackage() {}
