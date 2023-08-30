import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'feature_pre_patient_method_channel.dart';

abstract class FeaturePrePatientPlatform extends PlatformInterface {
  /// Constructs a FeaturePrePatientPlatform.
  FeaturePrePatientPlatform() : super(token: _token);

  static final Object _token = Object();

  static FeaturePrePatientPlatform _instance = MethodChannelFeaturePrePatient();

  /// The default instance of [FeaturePrePatientPlatform] to use.
  ///
  /// Defaults to [MethodChannelFeaturePrePatient].
  static FeaturePrePatientPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FeaturePrePatientPlatform] when
  /// they register themselves.
  static set instance(FeaturePrePatientPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
