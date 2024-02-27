library micro;

import 'package:injectable/injectable.dart';

export './src/repositories/quotation_repository.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataQuotationPackage() {}
