import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_hospital_method_channel.dart';

abstract class DataHospitalPlatform extends PlatformInterface {
  /// Constructs a DataHospitalPlatform.
  DataHospitalPlatform() : super(token: _token);

  static final Object _token = Object();

  static DataHospitalPlatform _instance = MethodChannelDataHospital();

  /// The default instance of [DataHospitalPlatform] to use.
  ///
  /// Defaults to [MethodChannelDataHospital].
  static DataHospitalPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataHospitalPlatform] when
  /// they register themselves.
  static set instance(DataHospitalPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
