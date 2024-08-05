library micro;

import 'package:injectable/injectable.dart';

export 'src/repositories/sale_repository.dart';
@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataSalePackage() {}
