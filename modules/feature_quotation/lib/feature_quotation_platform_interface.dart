import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'feature_quotation_method_channel.dart';

abstract class FeatureQuotationPlatform extends PlatformInterface {
  /// Constructs a FeatureQuotationPlatform.
  FeatureQuotationPlatform() : super(token: _token);

  static final Object _token = Object();

  static FeatureQuotationPlatform _instance = MethodChannelFeatureQuotation();

  /// The default instance of [FeatureQuotationPlatform] to use.
  ///
  /// Defaults to [MethodChannelFeatureQuotation].
  static FeatureQuotationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FeatureQuotationPlatform] when
  /// they register themselves.
  static set instance(FeatureQuotationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
