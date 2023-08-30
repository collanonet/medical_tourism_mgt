import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'feature_auth_method_channel.dart';

abstract class FeatureAuthPlatform extends PlatformInterface {
  /// Constructs a FeatureAuthPlatform.
  FeatureAuthPlatform() : super(token: _token);

  static final Object _token = Object();

  static FeatureAuthPlatform _instance = MethodChannelFeatureAuth();

  /// The default instance of [FeatureAuthPlatform] to use.
  ///
  /// Defaults to [MethodChannelFeatureAuth].
  static FeatureAuthPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FeatureAuthPlatform] when
  /// they register themselves.
  static set instance(FeatureAuthPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
