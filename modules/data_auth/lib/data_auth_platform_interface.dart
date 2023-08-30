import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_auth_method_channel.dart';

abstract class DataAuthPlatform extends PlatformInterface {
  /// Constructs a DataAuthPlatform.
  DataAuthPlatform() : super(token: _token);

  static final Object _token = Object();

  static DataAuthPlatform _instance = MethodChannelDataAuth();

  /// The default instance of [DataAuthPlatform] to use.
  ///
  /// Defaults to [MethodChannelDataAuth].
  static DataAuthPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataAuthPlatform] when
  /// they register themselves.
  static set instance(DataAuthPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
