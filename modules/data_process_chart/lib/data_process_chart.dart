
library micro;

// Package imports:
import 'package:injectable/injectable.dart';

export './src/repositories/process_chart_repository.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initDataProcessChartPackage() {}
