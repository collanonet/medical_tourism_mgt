import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'core_storage_method_channel.dart';

abstract class CoreStoragePlatform extends PlatformInterface {
  /// Constructs a CoreStoragePlatform.
  CoreStoragePlatform() : super(token: _token);

  static final Object _token = Object();

  static CoreStoragePlatform _instance = MethodChannelCoreStorage();

  /// The default instance of [CoreStoragePlatform] to use.
  ///
  /// Defaults to [MethodChannelCoreStorage].
  static CoreStoragePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CoreStoragePlatform] when
  /// they register themselves.
  static set instance(CoreStoragePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
