import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_sale_method_channel.dart';

abstract class DataSalePlatform extends PlatformInterface {
  /// Constructs a DataSalePlatform.
  DataSalePlatform() : super(token: _token);

  static final Object _token = Object();

  static DataSalePlatform _instance = MethodChannelDataSale();

  /// The default instance of [DataSalePlatform] to use.
  ///
  /// Defaults to [MethodChannelDataSale].
  static DataSalePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataSalePlatform] when
  /// they register themselves.
  static set instance(DataSalePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
