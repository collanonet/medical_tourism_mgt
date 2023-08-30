import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'feature_agent_method_channel.dart';

abstract class FeatureAgentPlatform extends PlatformInterface {
  /// Constructs a FeatureAgentPlatform.
  FeatureAgentPlatform() : super(token: _token);

  static final Object _token = Object();

  static FeatureAgentPlatform _instance = MethodChannelFeatureAgent();

  /// The default instance of [FeatureAgentPlatform] to use.
  ///
  /// Defaults to [MethodChannelFeatureAgent].
  static FeatureAgentPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FeatureAgentPlatform] when
  /// they register themselves.
  static set instance(FeatureAgentPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
