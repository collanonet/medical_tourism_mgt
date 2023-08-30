import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'feature_patient_method_channel.dart';

abstract class FeaturePatientPlatform extends PlatformInterface {
  /// Constructs a FeaturePatientPlatform.
  FeaturePatientPlatform() : super(token: _token);

  static final Object _token = Object();

  static FeaturePatientPlatform _instance = MethodChannelFeaturePatient();

  /// The default instance of [FeaturePatientPlatform] to use.
  ///
  /// Defaults to [MethodChannelFeaturePatient].
  static FeaturePatientPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FeaturePatientPlatform] when
  /// they register themselves.
  static set instance(FeaturePatientPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
