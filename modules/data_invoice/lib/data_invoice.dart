
library micro;

// Package imports:
import 'package:injectable/injectable.dart';

export './src/repositories/invoice_repository.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataInvoicePackage() {}
