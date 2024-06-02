library micro;

export 'src/api_service.dart';
export 'src/file_upload.dart';
export 'src/rest_client.dart';
export 'src/entities/entities.dart';
export 'src/interceptors/token_interceptor.dart';
import 'package:injectable/injectable.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
)
initMicroPackage() {}
