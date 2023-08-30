import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_quotation_method_channel.dart';

abstract class DataQuotationPlatform extends PlatformInterface {
  /// Constructs a DataQuotationPlatform.
  DataQuotationPlatform() : super(token: _token);

  static final Object _token = Object();

  static DataQuotationPlatform _instance = MethodChannelDataQuotation();

  /// The default instance of [DataQuotationPlatform] to use.
  ///
  /// Defaults to [MethodChannelDataQuotation].
  static DataQuotationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataQuotationPlatform] when
  /// they register themselves.
  static set instance(DataQuotationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
