import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'feature_sale_method_channel.dart';

abstract class FeatureSalePlatform extends PlatformInterface {
  /// Constructs a FeatureSalePlatform.
  FeatureSalePlatform() : super(token: _token);

  static final Object _token = Object();

  static FeatureSalePlatform _instance = MethodChannelFeatureSale();

  /// The default instance of [FeatureSalePlatform] to use.
  ///
  /// Defaults to [MethodChannelFeatureSale].
  static FeatureSalePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FeatureSalePlatform] when
  /// they register themselves.
  static set instance(FeatureSalePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
