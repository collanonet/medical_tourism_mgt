import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_pre_patient_method_channel.dart';

abstract class DataPrePatientPlatform extends PlatformInterface {
  /// Constructs a DataPrePatientPlatform.
  DataPrePatientPlatform() : super(token: _token);

  static final Object _token = Object();

  static DataPrePatientPlatform _instance = MethodChannelDataPrePatient();

  /// The default instance of [DataPrePatientPlatform] to use.
  ///
  /// Defaults to [MethodChannelDataPrePatient].
  static DataPrePatientPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataPrePatientPlatform] when
  /// they register themselves.
  static set instance(DataPrePatientPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
