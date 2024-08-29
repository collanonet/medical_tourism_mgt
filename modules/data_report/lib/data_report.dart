library micro;

// Package imports:
import 'package:injectable/injectable.dart';

export 'src/repositories/report_repository.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataReportPackage() {}
