import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_agent_method_channel.dart';

abstract class DataAgentPlatform extends PlatformInterface {
  /// Constructs a DataAgentPlatform.
  DataAgentPlatform() : super(token: _token);

  static final Object _token = Object();

  static DataAgentPlatform _instance = MethodChannelDataAgent();

  /// The default instance of [DataAgentPlatform] to use.
  ///
  /// Defaults to [MethodChannelDataAgent].
  static DataAgentPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataAgentPlatform] when
  /// they register themselves.
  static set instance(DataAgentPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
