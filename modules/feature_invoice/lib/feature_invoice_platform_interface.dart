import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'feature_invoice_method_channel.dart';

abstract class FeatureInvoicePlatform extends PlatformInterface {
  /// Constructs a FeatureInvoicePlatform.
  FeatureInvoicePlatform() : super(token: _token);

  static final Object _token = Object();

  static FeatureInvoicePlatform _instance = MethodChannelFeatureInvoice();

  /// The default instance of [FeatureInvoicePlatform] to use.
  ///
  /// Defaults to [MethodChannelFeatureInvoice].
  static FeatureInvoicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FeatureInvoicePlatform] when
  /// they register themselves.
  static set instance(FeatureInvoicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
