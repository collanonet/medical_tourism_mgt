library micro;

// Package imports:
import 'package:injectable/injectable.dart';

export 'src/storage.dart';
export 'src/converters/converter.dart';
export 'src/persistences/shared_preferences_persistence.dart';

@microPackageInit
initMicroPackage() {}
