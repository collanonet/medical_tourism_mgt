import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_invoice_method_channel.dart';

abstract class DataInvoicePlatform extends PlatformInterface {
  /// Constructs a DataInvoicePlatform.
  DataInvoicePlatform() : super(token: _token);

  static final Object _token = Object();

  static DataInvoicePlatform _instance = MethodChannelDataInvoice();

  /// The default instance of [DataInvoicePlatform] to use.
  ///
  /// Defaults to [MethodChannelDataInvoice].
  static DataInvoicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataInvoicePlatform] when
  /// they register themselves.
  static set instance(DataInvoicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
