import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_patient_method_channel.dart';

abstract class DataPatientPlatform extends PlatformInterface {
  /// Constructs a DataPatientPlatform.
  DataPatientPlatform() : super(token: _token);

  static final Object _token = Object();

  static DataPatientPlatform _instance = MethodChannelDataPatient();

  /// The default instance of [DataPatientPlatform] to use.
  ///
  /// Defaults to [MethodChannelDataPatient].
  static DataPatientPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataPatientPlatform] when
  /// they register themselves.
  static set instance(DataPatientPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
