import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'core_network_method_channel.dart';

abstract class CoreNetworkPlatform extends PlatformInterface {
  /// Constructs a CoreNetworkPlatform.
  CoreNetworkPlatform() : super(token: _token);

  static final Object _token = Object();

  static CoreNetworkPlatform _instance = MethodChannelCoreNetwork();

  /// The default instance of [CoreNetworkPlatform] to use.
  ///
  /// Defaults to [MethodChannelCoreNetwork].
  static CoreNetworkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CoreNetworkPlatform] when
  /// they register themselves.
  static set instance(CoreNetworkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
