
library micro;

import 'package:injectable/injectable.dart';

export './src/repositories/agent_repository.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataAgentPackage() {}
